module Couchbase

  module ViewHelpers
    class PaginateParams

      PER_PAGE_DEFAULT = 100

      def initialize(params = {})
        @page     = (params[:page]     || 1).to_i
        @per_page = (params[:per_page] || PER_PAGE_DEFAULT).to_i
      end

      def to_h
        {
          skip: (@page - 1) * @per_page,
          limit: @per_page
        }
      end
    end
  end
end
