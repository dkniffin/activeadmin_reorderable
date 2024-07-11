class CreateItemQueues < ActiveRecord::Migration[6.1]
  def change
    create_table :item_queues do |t|

      t.timestamps
    end
  end
end
