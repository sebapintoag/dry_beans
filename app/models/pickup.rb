# frozen_string_literal: true

# Pickup
# trip_id: ID of the belonging trip
# token: Token identifier of the pickup
# state: Current state of the pickup
# picked_up_at: Date and time when the pickup was done
# postponed_at: Date and time when the pickup was posponed
# cancelled_at: Date and time when the pickup was cancelled
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
