class DeliverySerializer < Blueprinter::Base
  identifier :id
  fields :token, :state

  view :short do
    fields :delivered_at, :proof_of_delivery
  end

  view :extended do
    include_view :short

    fields :postponed_at, :rejected_at,
          :receiver_name, :receiver_phone, :receiver_legal_id, :created_at, :updated_at
  end

  def self.serialize!(resource, view_name = :extended)
    root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
    self.render(resource, root: root_name, view: view_name)
  end
end