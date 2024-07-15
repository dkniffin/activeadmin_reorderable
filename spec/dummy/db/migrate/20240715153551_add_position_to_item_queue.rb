class AddPositionToItemQueue < ActiveRecord::Migration[6.1]
  def change
    add_column :item_queues, :position, :integer
  end
end
