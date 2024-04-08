class RouteSerializer < Blueprinter::Base
    identifier :id
  
    fields :code, :starting_point, :destination_point, :vehicle_plate, :state,
           :approved_at, :started_at, :finished_at, :cancelled_at,
           :created_at, :updated_at
    
    association :trips, blueprint: TripSerializer

    def self.serialize!(resource)
      root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
      self.render(resource, root: root_name)
    end
  end