require 'rails_helper'

describe "Reorderable", type: :feature do
  let!(:queue) { ItemQueue.create(title: "Queue A") }
  let!(:item1) { Item.create(name: "Item 1", description: "Description 1", item_queue: queue, position: 1) }
  let!(:item2) { Item.create(name: "Item 2", description: "Description 2", item_queue: queue, position: 2) }
  let!(:queue2) { ItemQueue.create(title: "Queue B") }

  it "item index page shows items" do
    visit admin_items_path
    expect(page).to have_content item1.name
    expect(page).to have_content item1.description
    expect(page).to have_content item2.name
    expect(page).to have_content item2.description
  end

  it "item queue show page allows reordering", js: true do
    visit admin_item_queue_path(queue)

    # Sanity checks
    expect(page).to have_css("table.aa-reorderable")

    row1 = find(".aa-reorderable tbody tr:nth-child(1)")
    expect(row1).to have_content(item1.name)

    row2 = find(".aa-reorderable tbody tr:nth-child(2)")
    expect(row2).to have_content(item2.name)

    # Test initial state
    expect(item1.name).to appear_before(item2.name)
    expect(item1.reload.position).to eq(1)
    expect(item2.reload.position).to eq(2)

    row1.find(".reorder-handle").drag_by(0, 50) # Drag down 50, far enough to put it in the next row

    expect(item2.name).to appear_before(item1.name)

    # Check that the position column updated immediately
    expect(row1.find(".position")).to have_content("2")
    expect(row2.find(".position")).to have_content("1")

    sleep 1 # Give some time for the DB to update

    expect(item1.reload.position).to eq(2)
    expect(item2.reload.position).to eq(1)

    expect(page).to_not have_js_errors
  end

  it "item queue index allows reordering", js: true do
    visit admin_item_queues_path

    expect(page).to have_css("table.aa-reorderable")

    row1 = find(".aa-reorderable tbody tr:nth-child(1)")
    expect(row1).to have_content(queue.title)

    row2 = find(".aa-reorderable tbody tr:nth-child(2)")
    expect(row2).to have_content(queue2.title)


    # Test initial state
    expect(queue.title).to appear_before(queue2.title)
    expect(queue.reload.position).to eq(1)
    expect(queue2.reload.position).to eq(2)

    row1.find(".reorder-handle").drag_by(0, 50) # Drag down 50, far enough to put it in the next row

    expect(queue2.title).to appear_before(queue.title)

    # Check that the position column updated immediately
    expect(row1.find(".position")).to have_content("2")
    expect(row2.find(".position")).to have_content("1")

    sleep 1 # Give some time for the DB to update

    expect(queue.reload.position).to eq(2)
    expect(queue2.reload.position).to eq(1)

    expect(page).to_not have_js_errors
  end
end
