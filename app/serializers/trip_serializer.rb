class TripSerializer < Blueprinter::Base
    identifier :id
  
    fields :code, :destination_person_name, :destination_person_phone,
           :destination_address, :destination_lat, :destination_lng,
           :state, :started_at, :finished_at, :cancelled_at, :estimated_arrival_at,
           :created_at, :updated_at
    
   association :deliveries, blueprint: DeliverySerializer
   association :pickups, blueprint: PickupSerializer

    def self.serialize!(resource)
      root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
      self.render(resource, root: root_name)
    end
  end