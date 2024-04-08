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
            transitions from: [:created, :approved], to: :cancelled
        end
    end

    private

    def ensure_code_is_present
        generate_token('code')
    end
end
