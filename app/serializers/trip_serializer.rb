class TripSerializer < Blueprinter::Base
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
  
  

  def self.serialize!(resource, view_name = :extended)
    root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
    self.render(resource, root: root_name, view: view_name)
  end
end