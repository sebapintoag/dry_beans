# frozen_string_literal: true

class DeliverySerializer < Blueprinter::Base
  include Serializable

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
end
