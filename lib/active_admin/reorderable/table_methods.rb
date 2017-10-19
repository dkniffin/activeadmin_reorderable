module ActiveAdmin
  module Reorderable
    module TableMethods

      def reorder_column
        column '', :class => 'reorder-handle-col' do |resource|
          reorder_handle_for(resource)
        end
      end

      private

      def reorder_handle_for(resource)
        reorder_url, query_params = resource_path(resource).split '?', 2
        reorder_url += "/reorder"
        reorder_url += "?" + query_params if query_params
        span(reorder_handle_content, :class => 'reorder-handle', 'data-reorder-url' => reorder_url)
      end

      def reorder_handle_content
        '&equiv;&equiv;'.html_safe
      end

    end

    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)
  end
end
