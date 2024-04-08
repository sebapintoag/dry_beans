# frozen_string_literal: true

# Module that includes support for AASM events
module AasmEventAt
  extend ActiveSupport::Concern

  included do
    # Updates AASM event timestamps
    def update_aasm_timestamps
      send('update', "#{aasm.to_state}_at": Time.zone.now)
    end
  end
end
