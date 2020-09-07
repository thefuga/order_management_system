require 'test_helper'

class OrderInitialStateTest < ActiveSupport::TestCase
  test "Initial state" do 
    order = Order.new

    assert order.pending?
  end
end
