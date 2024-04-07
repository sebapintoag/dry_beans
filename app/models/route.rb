class Route < ApplicationRecord
    include AASM
    include AasmEventAt

    has_many :trips, dependent: :destroy

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
            transitions from: [:created, :approved], to: :cancelled
        end
    end
end
