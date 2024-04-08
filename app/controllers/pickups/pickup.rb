# frozen_string_literal: true

# Class responsible of changing the state of a pickup.
module Pickups
  class Pickup
    def initialize(pickup)
      @pickup = pickup
    end

    def process
      @pickup.pickup!
    end
  end
end
