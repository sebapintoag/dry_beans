class RoutesController < ApplicationController
    before_action :find_one, only: :show
    before_action :find_all, only: :index

    def index
        render json: RouteSerializer.serialize!(@routes), status: 200
    end

    def show
        render json: RouteSerializer.serialize!(@route), status: 200
    end

    private

    def find_all
        @routes = Route.all
    end

    def find_one
        @route = Route.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: {error: { message: "Route with ID #{params[:id]} not found" }}, status: 404
    end
end
