# frozen_string_literal: true

# Trip
# code: Code identifier of a trip
# route_id: ID of the belonging route
# destination_person_name: Name of the person to contact at destination
# destination_person_phone: Phone number of the person to contact at destination
# destination_address: Destination address
# destination_lat: Destination latitude
# destination_lng: Destination longitude
# state: Current state of the trip
# approved_at: Date and time when the trip was approved
# started_at: Date and time when the trip was approved
# finished_at: Date and time when the trip was approved
# cancelled_at: Date and time when the trip was approved
# estimated_arrival_at: Estimated or programmed date and time of arrival at destination
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

  # Generates a code if none were provided
  def ensure_code_is_present
    generate_token('code', "#{route.code}_")
  end
end
