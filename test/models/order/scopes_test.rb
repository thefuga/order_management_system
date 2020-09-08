# frozen_string_literal: true

require 'test_helper'

class OrderScopesTest < ActiveSupport::TestCase
  test 'Pending state scope' do
    pending_orders = Order.pending

    assert pending_orders.one?
    assert_equal orders(:pending), pending_orders.first
  end

  test 'In progress order states' do
    in_progress_orders = Order.in_progress

    assert in_progress_orders.one?
    assert_equal orders(:in_progress), in_progress_orders.first
  end

  test 'Completed order states' do
    completed_orders = Order.completed

    assert completed_orders.one?
    assert_equal orders(:completed), completed_orders.first
  end

  test 'By Control number scope' do
    expected_order = orders(:pending)

    found_orders = Order.by_control_number(expected_order.control_number)

    assert_equal expected_order, found_orders.first
  end
end
