class Deliveries::Deliver
    def initialize(delivery, deliver_params)
        @delivery = delivery
        @deliver_params = deliver_params
    end

    def process
        @delivery.deliver!
        @delivery.update(@deliver_params)
    end
end