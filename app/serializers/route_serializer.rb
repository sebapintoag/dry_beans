# frozen_string_literal: true

class RouteSerializer < Blueprinter::Base
  include Serializable

  identifier :id
  fields :code, :state

  view :short do
    association :trips_sorted, name: :trips, blueprint: TripSerializer, view: :short
  end

  view :extended do
    fields :starting_point, :destination_point, :vehicle_plate, :approved_at, :started_at, :finished_at, :cancelled_at,
           :created_at, :updated_at

    association :trips_sorted, name: :trips, blueprint: TripSerializer
  end
end
