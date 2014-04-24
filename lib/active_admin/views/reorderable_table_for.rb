module ActiveAdmin
  module Views
    class ReorderableTableFor < IndexAsTable::IndexTableFor
      builder_method :reorderable_table_for

      def build(collection, options = {}, &block)
        options[:class] = [options[:class], 'aa-reorderable'].compact.join(' ')

        super(collection, options) do
          reorder_column
          block.call if block.present?
        end
      end

    end
  end
end
