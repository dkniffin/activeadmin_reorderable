# ActiveAdmin Reorderable

Drag and drop to reorder your ActiveAdmin tables.

![Drag and drop reordering](https://s3.amazonaws.com/kurtzkloud.com/p/activeadmin_reorderable/screenshot.gif)

## Requirements
Your resource classes must respond to `insert_at` ala the [`acts_as_list`](https://github.com/swanandp/acts_as_list) API. You don't need to use `acts_as_list`, but if you don't, make sure to define `insert_at`.

## Installation
Add `gem 'activeadmin_reorderable'` to your Gemfile.
Add `#= require activeadmin_reorderable` to app/assets/javascripts/active_admin.js.coffee
Add `@import "activeadmin_reorderable";` as the last `@import` statement in app/assets/stylesheets/active_admin.css.scss

## Use
`widgets.rb`
```ruby
  ActiveAdmin.register Part do
    reorderable
  end

  ActiveAdmin.register Widget do
    config.sort_order = 'position_asc' # assuming Widget.insert_at modifies the `position` attribute
    config.paginate   = false

    reorderable

    actions :index, :show

    # Reorderable Index Table
    index as: :reorderable_table do
      column :id
      column :name
    end

    show do |widget|
      attributes_table do
        row :id
        row :name
      end

      # Reorderable Subtable
      # Note: you must include `reorderable` in the ActiveAdmin configuration for the resource
      # being sorted. See the `Part` config at the top of this code block.
      reorderable_table_for widget.parts do
        column :name
        column :cost
      end
    end
  end
```
