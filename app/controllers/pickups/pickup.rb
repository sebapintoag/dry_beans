# frozen_string_literal: true

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
