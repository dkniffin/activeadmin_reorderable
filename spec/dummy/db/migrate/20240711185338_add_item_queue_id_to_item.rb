class AddItemQueueIdToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :item_queue_id, :integer
  end
end
