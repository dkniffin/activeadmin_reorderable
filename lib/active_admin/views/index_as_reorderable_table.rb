module ActiveAdmin
  module Views
    class IndexAsReorderableTable < IndexAsTable

      def self.index_name
        'reorderable_table'
      end

      def build(page_presenter, collection)
        add_class 'aa-reorderable'
        super(page_presenter, collection)
      end

      def table_for(*args, &block)
        insert_tag ReorderableTableFor, *args, &block
      end

    end
  end
end
