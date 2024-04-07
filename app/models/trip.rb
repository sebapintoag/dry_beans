class Trip < ApplicationRecord
    include AASM
    include AasmEventAt

    belongs_to :route

    has_many :deliveries, dependent: :destroy
    has_many :pickups, dependent: :destroy

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
            transitions from: [:pending, :started], to: :cancelled
        end
    end
end
