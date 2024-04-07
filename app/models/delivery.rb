class Delivery < ApplicationRecord
    include AASM
    include AasmEventAt

    belongs_to :trip

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
