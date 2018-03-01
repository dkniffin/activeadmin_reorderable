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
        aa_resource   = active_admin_namespace.resource_for(resource.class)
        instance_name = aa_resource.resources_configuration[:self][:route_instance_name]

        url = send([:reorder, aa_resource.route_prefix, instance_name, :path].join('_'), resource)

        span(reorder_handle_content, :class => 'reorder-handle', 'data-reorder-url' => url)
      end

      def reorder_handle_content
        '&equiv;&equiv;'.html_safe
      end

    end

    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)
  end
end

