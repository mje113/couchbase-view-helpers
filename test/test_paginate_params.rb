require 'helper'

class TestPaginateParams < MiniTest::Unit::TestCase

  def test_can_parse_params_into_view_params
    paginator = Couchbase::ViewHelpers::PaginateParams.new({ page: 2, per_page: 20 })
    assert_equal({ skip: 20, limit: 20 }, paginator.to_h)
  end

  def test_can_have_defaults
    paginator = Couchbase::ViewHelpers::PaginateParams.new
    assert_equal({ skip: 0, limit: 100 }, paginator.to_h)
  end

  def test_can_interface_with_view
    view = MockView.new
    view.paginate
    assert_equal({ skip: 0, limit: 100 }, view.params)
  end

  def test_can_deal_wth_strings
    paginator = Couchbase::ViewHelpers::PaginateParams.new({ page: '2', per_page: '20' })
    assert_equal({ skip: 20, limit: 20 }, paginator.to_h)
  end
end
