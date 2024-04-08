# frozen_string_literal: true

class DeliveriesController < ApplicationController
  before_action :find_one, only: :deliver

  def deliver
    Deliveries::Deliver.new(@delivery, deliver_params).process

    render json: DeliverySerializer.serialize!(@delivery.reload, :extended), status: :ok
  rescue StandardError => e
    render json: { error: { message: e.message } }, status: :bad_request
  end

  private

  def find_one
    @delivery = Delivery.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: { message: "Delivery with ID #{params[:id]} not found" } }, status: :not_found
  end

  def deliver_params
    params.require(:delivery).permit(:receiver_name, :receiver_phone, :receiver_legal_id, :proof_of_delivery)
  end
end
