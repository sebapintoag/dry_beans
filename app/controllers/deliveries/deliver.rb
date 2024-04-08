# frozen_string_literal: true

module Deliveries
  class Deliver
    def initialize(delivery, deliver_params)
      @delivery = delivery
      @deliver_params = deliver_params
    end

    def process
      raise "Can't deliver. Reception data is not present" if @deliver_params.blank?
      raise "Can't deliver. Delivery is #{@delivery.state} state." unless @delivery.may_deliver?

      @delivery.deliver!
      @delivery.update(@deliver_params)
    end
  end
end
