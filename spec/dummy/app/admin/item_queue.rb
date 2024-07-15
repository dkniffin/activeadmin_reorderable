ActiveAdmin.register ItemQueue do
  config.sort_order = 'position_asc'

  permit_params :id, :position

  reorderable

  index as: :reorderable_table do
    column :id
    column :title
    column :position, class: "position"
  end

  show do |item_queue|
    attributes_table do
      row :id
      row :created_at
      row :updated_at
    end

    reorderable_table_for item_queue.items do
      column :name
      column :description
      column :position, class: "position"
    end
  end
end
