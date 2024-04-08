# frozen_string_literal: true

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
