class PickupSerializer < Blueprinter::Base
  identifier :id
  fields :token, :state

  view :short do
    fields :picked_up_at
  end
  
  view :extended do
    include_view :short

    fields :postponed_at, :cancelled_at, :created_at, :updated_at
  end

  def self.serialize!(resource, view_name = :extended)
    root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
    self.render(resource, root: root_name, view: view_name)
  end
end