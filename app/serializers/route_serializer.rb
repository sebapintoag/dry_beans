class RouteSerializer < Blueprinter::Base
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

  def self.serialize!(resource, view_name = :extended)
    root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
    self.render(resource, root: root_name, view: view_name)
  end
end