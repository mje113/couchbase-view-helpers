require 'helper'

class TestViewHelpers < MiniTest::Unit::TestCase

  def setup
    @view = MockView.new
  end

  def test_can_set_key
    assert_instance_of MockView, @view.key('foo')
    assert_equal "\"foo\"", @view.params[:key]
  end

  def test_can_set_keys
    assert_instance_of MockView, @view.keys(['foo', 'bar'])
    assert_equal ["\"foo\"", "\"bar\""], @view.params[:keys]
  end

  def test_can_set_integer_key
    assert_instance_of MockView, @view.key(1234)
    assert_equal '1234', @view.params[:key]
  end

  def test_can_set_keys_with_args
    assert_instance_of MockView, @view.keys('foo', 'bar')
    assert_equal ["\"foo\"", "\"bar\""], @view.params[:keys]
  end

  def test_can_paginate
    assert_instance_of MockView, @view.paginate(page: 2, per_page: 20)
    assert_equal 20, @view.params[:skip]
    assert_equal 20, @view.params[:limit]
  end

  def test_can_paginate_by_page
    assert_instance_of MockView, @view.page(2)
    assert_equal 100, @view.params[:skip]
    assert_equal 100, @view.params[:limit]
  end

  def test_can_paginate_by_per
    assert_instance_of MockView, @view.per(20)
    assert_equal 0,  @view.params[:skip]
    assert_equal 20, @view.params[:limit]
  end

  def test_can_paginate_by_page_and_per
    skip "need to persist"
    assert_instance_of MockView, @view.page(2).per(20)
    assert_equal 20, @view.params[:skip]
    assert_equal 20, @view.params[:limit]
  end

  def test_can_set_order
    assert_instance_of MockView, @view.order('asc')
    refute false, @view.params[:descending]

    @view.order('ascending')
    refute false, @view.params[:descending]

    @view.order('desc')
    assert true, @view.params[:descending]
  end

  def test_can_set_order_by_desc
    assert_instance_of MockView, @view.desc
    assert true, @view.params[:descending]
  end

  def test_can_set_order_by_asc
    assert_instance_of MockView, @view.asc
    refute false, @view.params[:descending]
  end

  def test_can_group
    assert_instance_of MockView, @view.group
    assert @view.params[:group]

    @view.group(false)
    refute @view.params[:group]
  end

  def test_can_group_level
    assert_instance_of MockView, @view.group_level(2)
    assert_equal 2, @view.params[:group_level]

    @view.level(3)
    assert_equal 3, @view.params[:group_level]
  end

  def test_can_set_stale
    assert_instance_of MockView, @view.stale
    assert_equal :ok, @view.params[:stale]
  end

  def test_can_set_fresh
    assert_instance_of MockView, @view.fresh
    refute @view.params[:stale]
  end

  def test_can_set_update_after
    assert_instance_of MockView, @view.update_after
    assert_equal :update_after, @view.params[:stale]
  end

  def test_can_set_include_docs
    assert_instance_of MockView, @view.include_docs
    assert @view.params[:include_docs]
  end

  def test_can_set_no_docs
    assert_instance_of MockView, @view.include_docs
    assert @view.params[:include_docs]
  end
end
