require 'test_helper'

class OrderValidationsTest < ActiveSupport::TestCase
  test "Valid orders" do
    Order::VALID_ORDER_STATES.each do |state|
      order = orders(state)
      assert order.valid?
    end
  end

  test "Orders with invalid state" do
    order = orders("pending")

    [nil, ""].each do |state|
      order.state = state
      assert_not order.valid?
    end
  end

  test "Orders with invalid control_number" do
    order = orders("pending")

    [nil, "numeric", 1.1].each do |control_number|
      order.control_number = control_number
      assert_not order.valid?
    end
  end
end
