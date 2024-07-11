class ItemQueue < ApplicationRecord
  has_many :items, -> { order(position: :asc) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["items"]
  end
end
