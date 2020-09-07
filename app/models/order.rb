class Order < ApplicationRecord
  VALID_ORDER_STATES = ["pending", "in_progress", "completed"]

  validates :state, inclusion: { in: VALID_ORDER_STATES }

  validates :control_number, numericality: { only_integer: true },
                             uniqueness: true

  scope :pending,           -> { where(state: "pending") }
  scope :in_progress,       -> { where(state: "in_progress") }
  scope :completed,         -> { where(state: "completed") }
  scope :by_control_number, ->(control_number) { find_by(control_number: control_number)}
end
