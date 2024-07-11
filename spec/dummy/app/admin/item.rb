ActiveAdmin.register Item do
  permit_params :id, :name, :description, :position, :item_queue_id

  reorderable
end
