require 'rails_helper'

describe "Reorderable", type: :feature do
  context "allows for reordering" do
    context "with true value" do
      let!(:item1) { Item.create(name: "Item 1", description: "Description 1") }
      let!(:item2) { Item.create(name: "Item 2", description: "Description 2") }

      before do
        visit admin_items_path
      end

      it "shows people" do
        expect(page).to have_content item1.name
        expect(page).to have_content item1.description
        expect(page).to have_content item2.name
        expect(page).to have_content item2.description
      end
    end
  end
end
