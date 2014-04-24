module ActiveAdmin
  module Reorderable
    module DSL
      private

      def reorderable(&block)
        body = proc do
          resource.insert_at(params[:position].to_i)
          render :nothing => true
        end

        member_action(:reorder, :method => :post, &block || body)
      end
    end
  end
end
