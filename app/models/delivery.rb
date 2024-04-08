# frozen_string_literal: true

# Delivery
# trip_id: ID of the belonging trip
# token: Token identifier of the delivery
# state: Current state of the delivery
# delivered_at: Date and time when the delivery was done
# postponed_at: Date and time when the delivery was posponed
# rejected_at: Date and time when the delivery was rejected
# receiver_name: Name of the person who receives the delivery
# receiver_phone: Phone number of the person who receives the delivery
# receiver_legal_id: Legal number identification of the person who receives the delivery
# proof_of_delivery: Proof that delivery was successfully completed
class Delivery < ApplicationRecord
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
    state :delivered
    state :postponed
    state :rejected

    after_all_transitions :update_aasm_timestamps

    event :deliver do
      transitions from: :pending, to: :delivered
    end

    event :postpone do
      transitions from: :pending, to: :postponed
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
