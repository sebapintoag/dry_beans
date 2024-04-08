class PickupSerializer < Blueprinter::Base
    identifier :id
  
    fields :token, :state, :picked_up_at,
           :postponed_at, :cancelled_at,
           :created_at, :updated_at
    
    def self.serialize!(resource)
      root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
      self.render(resource, root: root_name)
    end
  end