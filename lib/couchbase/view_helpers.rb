require 'couchbase/view_helpers/version'

module Couchbase

  module ViewHelpers

    # Keys
    def key(key)
      add_param(key: key)
    end

    def keys(*keys)
      add_param(keys: Array(keys).flatten)
    end

    # Pagination
    def paginate(params = {})
      add_param(PaginateParams.new(params).to_h)
    end

    def page(page_num)
      paginate(page: page_num)
    end

    def per(per_page)
      paginate(per_page: per_page)
    end

    # Ordering
    def order(direction)
      add_param(descending: (direction.to_s =~ /^asc/i) != 0)
    end

    def desc
      order('desc')
    end

    def asc
      order('asc')
    end

    # Grouping
    def group(group = true)
      add_param(group: group)
    end

    def group_level(group_level)
      add_param(group_level: group_level)
    end
    alias_method :level, :group_level

    # Reducing
    def reduce(reduce = true)
      add_param(reduce: reduce)
    end

    # Freshness
    def stale(stale = :ok)
      add_param(stale: stale)
    end

    def fresh
      stale(false)
    end

    def update_after
      stale(:update_after)
    end

    # Docs
    def include_docs(docs = true)
      add_param(include_docs: docs)
    end

    def no_docs
      include_docs(false)
    end

    protected

    def add_param(param)
      @params.merge!(param)
      self
    end

  end
end
