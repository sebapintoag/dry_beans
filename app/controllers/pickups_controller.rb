class PickupsController < ApplicationController
    before_action :find_one, only: :pickup

    def pickup
        Pickups::Pickup.new(@pickup).process

        render json: PickupSerializer.serialize!(@pickup.reload), status: 200
    end

    private

    def find_one
        @pickup = Pickup.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: {error: { message: "Pickup with ID #{params[:id]} not found" }}, status: 404
    end
end
