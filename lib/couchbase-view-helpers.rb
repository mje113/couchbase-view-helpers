require 'couchbase'
require 'couchbase/view_helpers'
require 'couchbase/view_helpers/paginate_params'
require 'couchbase/view_helpers/version'

module Couchbase
  class View
    include ViewHelpers
  end
end
