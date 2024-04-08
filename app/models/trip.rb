# frozen_string_literal: true

class Trip < ApplicationRecord
  include AASM
  include AasmEventAt
  include Tokenable

  belongs_to :route

  has_many :deliveries, dependent: :destroy
  has_many :pickups, dependent: :destroy

  validates :code, presence: true
  validates :destination_address, presence: true
  validates :state, presence: true
  validates :route, presence: true

  before_validation :ensure_code_is_present

  scope :in_order, -> { order(estimated_arrival_at: :asc) }

  aasm column: :state do
    state :pending, initial: true
    state :started
    state :finished
    state :cancelled

    after_all_transitions :update_aasm_timestamps

    event :start do
      transitions from: :pending, to: :started
    end

    event :finish do
      transitions from: :started, to: :finished
    end

    event :cancel do
      transitions from: %i[pending started], to: :cancelled
    end
  end

  private

  def ensure_code_is_present
    generate_token('code', "#{route.code}_")
  end
end
