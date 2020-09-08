# frozen_string_literal: true

class Order < ApplicationRecord
  include OrderStateMachine

  VALID_ORDER_STATES = %w[pending in_progress completed].freeze

  validates :state, inclusion: { in: VALID_ORDER_STATES }

  validates :control_number, numericality: { only_integer: true },
                             uniqueness: true

  scope :pending,           -> { where(state: 'pending') }
  scope :in_progress,       -> { where(state: 'in_progress') }
  scope :completed,         -> { where(state: 'completed') }
  scope :by_control_number, lambda { |control_number|
    where control_number: control_number
  }
end
