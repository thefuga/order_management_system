module OrderStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :state do
      state :pending, initial: true
      state :in_progress
      state :completed

      event :start do
        transitions from: :pending, to: :in_progress
      end

      event :complete do
        transitions from: :in_progress, to: :completed
      end
    end
  end
end
