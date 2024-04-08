# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :find_one, only: :show
  before_action :find_all, only: :index

  # List all routes
  def index
    render json: RouteSerializer.serialize!(@routes, :short), status: :ok
  end

  # Show one route
  def show
    render json: RouteSerializer.serialize!(@route, :extended), status: :ok
  end

  private

  # Get all routes
  def find_all
    @routes = Route.all
  end

  # Search a single route by id
  def find_one
    @route = Route.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: { message: "Route with ID #{params[:id]} not found" } }, status: :not_found
  end
end
