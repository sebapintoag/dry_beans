class DeliveriesController < ApplicationController
    def deliver
        Deliveries::Deliver.new(1).process
    end
end
