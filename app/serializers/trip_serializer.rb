# frozen_string_literal: true

class TripSerializer < Blueprinter::Base
  include Serializable

  identifier :id
  fields :code, :state, :destination_address

  view :short do
    fields :destination_lat, :destination_lng

    association :deliveries, blueprint: DeliverySerializer, view: :short
    association :pickups, blueprint: PickupSerializer, view: :short
  end

  view :extended do
    include_view :short
    fields :destination_person_name, :destination_person_phone, :started_at, :finished_at,
           :cancelled_at, :estimated_arrival_at, :created_at, :updated_at

    association :deliveries, blueprint: DeliverySerializer, view: :extended
    association :pickups, blueprint: PickupSerializer, view: :extended
  end
end
