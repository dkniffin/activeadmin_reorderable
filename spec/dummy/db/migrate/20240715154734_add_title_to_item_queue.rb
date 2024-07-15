class AddTitleToItemQueue < ActiveRecord::Migration[6.1]
  def change
    add_column :item_queues, :title, :string
  end
end
