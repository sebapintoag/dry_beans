# frozen_string_literal: true

class Pickup < ApplicationRecord
  include AASM
  include AasmEventAt
  include Tokenable

  belongs_to :trip

  validates :token, presence: true
  validates :state, presence: true
  validates :trip, presence: true

  before_validation :generate_token

  aasm column: :state do
    state :pending, initial: true
    state :picked_up
    state :postponed
    state :cancelled

    after_all_transitions :update_aasm_timestamps

    event :pickup do
      transitions from: :pending, to: :picked_up
    end

    event :postpone do
      transitions from: :pending, to: :postponed
    end

    event :cancel do
      transitions from: :pending, to: :cancelled
    end
  end
end
