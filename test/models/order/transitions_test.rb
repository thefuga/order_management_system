require 'test_helper'

class OrderTransitionsTest < ActiveSupport::TestCase
  test "Pending valid transitions" do
    order = orders(:pending)

    assert order.start
  end

  test "Pending invalid transitions" do
    order = orders(:pending)

    assert_raises { order.complete }
  end

  test "In progress valid transitions" do
    order = orders(:in_progress)

    assert order.complete
  end

  test "In progress invalid transitions" do
    order = orders(:in_progress)

    assert_raises { order.start }
  end

  test "Complete invalid transitions" do
    order = orders(:completed)

    assert_raises { order.start }
    assert_raises { order.complete }
  end
end
