class PickupSerializer < Blueprinter::Base
  include Serializable

  identifier :id
  fields :token, :state

  view :short do
    fields :picked_up_at
  end
  
  view :extended do
    include_view :short

    fields :postponed_at, :cancelled_at, :created_at, :updated_at
  end
end