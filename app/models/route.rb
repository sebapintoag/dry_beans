# frozen_string_literal: true

# Route
# code: Code identifier of a route
# starting_point: Starting address or location
# destination_point: Destination address or location
# vehicle_plate: Vehicle registration plate of assigned vehicle to the route
# state: current state of the route
# approved_at: Date and time when the route was approved
# started_at: Date and time when the route was approved
# finished_at: Date and time when the route was approved
# cancelled_at: Date and time when the route was approved
class Route < ApplicationRecord
  include AASM
  include AasmEventAt
  include Tokenable

  has_many :trips, dependent: :destroy

  validates :code, presence: true
  validates :starting_point, presence: true
  validates :state, presence: true

  before_validation :ensure_code_is_present

  aasm column: :state do
    state :created, initial: true
    state :approved
    state :started
    state :finished
    state :cancelled

    after_all_transitions :update_aasm_timestamps

    event :approve do
      transitions from: :created, to: :approved
    end

    event :start do
      transitions from: :approved, to: :started
    end

    event :finish do
      transitions from: :started, to: :finished
    end

    event :cancel do
      transitions from: %i[created approved], to: :cancelled
    end
  end

  # Returns trips of the route ordered by estimated_arrival datetime
  # @return [Array<Trip>] trips of the route
  def trips_sorted
    trips.in_order
  end

  private

  # Generates a code if none were provided
  def ensure_code_is_present
    generate_token('code')
  end
end
