require 'helper'

class TestIntegration < MiniTest::Unit::TestCase

  def setup
    @view = Couchbase::View.new('bucket', 'endpoint')
  end

  def test_has_public_methods
    [:key, :keys, :paginate, :page, :per, :order, :desc, :asc].each do |meth|
      assert @view.respond_to?(meth), "View not responding to #{meth}"
    end
  end

end
