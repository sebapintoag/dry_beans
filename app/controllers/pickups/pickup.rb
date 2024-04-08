class Pickups::Pickup
    def initialize(pickup)
        @pickup = pickup
    end

    def process
        @pickup.pickup!
    end
end