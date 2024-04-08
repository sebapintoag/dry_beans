class DeliverySerializer < Blueprinter::Base
    identifier :id
  
    fields :token, :state, :delivered_at, :postponed_at, :rejected_at,
           :receiver_name, :receiver_phone, :receiver_legal_id, :proof_of_delivery,
           :created_at, :updated_at
    
    def self.serialize!(resource)
      root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
      self.render(resource, root: root_name)
    end
  end