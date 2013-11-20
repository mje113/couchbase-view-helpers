require 'minitest/autorun'
require_relative '../lib/couchbase-view-helpers'

class MockView
  include Couchbase::ViewHelpers

  attr_accessor :params
  def initialize(params = {})
    @params = params
  end
end
