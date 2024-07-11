class Item < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "position", "updated_at"]
  end
end
