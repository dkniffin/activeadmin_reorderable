require "acts_as_list"

class Item < ApplicationRecord
  belongs_to :item_queue
  acts_as_list scope: :item_queue

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "position", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["item_queue"]
  end
end
