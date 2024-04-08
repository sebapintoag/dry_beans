module AasmEventAt
    extend ActiveSupport::Concern
  
    included do
        def update_aasm_timestamps
            send('update', "#{aasm.to_state}_at": Time.zone.now)
        end
    end
end