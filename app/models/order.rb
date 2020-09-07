class Order < ApplicationRecord
  VALID_ORDER_STATES = ["pending", "in_progress", "completed"]

  validates :state, inclusion: { in: VALID_ORDER_STATES }

  validates :control_number, numericality: { only_integer: true },
                             uniqueness: true
end
