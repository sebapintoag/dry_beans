# frozen_string_literal: true

class PickupsController < ApplicationController
  before_action :find_one, only: :pickup

  # Performs a pickup
  def pickup
    Pickups::Pickup.new(@pickup).process

    render json: PickupSerializer.serialize!(@pickup.reload, :extended), status: :ok
  end

  private

  # Search a single pickup by id
  def find_one
    @pickup = Pickup.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: { message: "Pickup with ID #{params[:id]} not found" } }, status: :not_found
  end
end
