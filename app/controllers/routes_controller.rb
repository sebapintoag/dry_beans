# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :find_one, only: :show
  before_action :find_all, only: :index

  PER_PAGE = 5

  # List all routes
  def index
    render json: RouteSerializer.serialize!(@routes, :short, pagination_data), status: :ok
  end

  # Show one route
  def show
    render json: RouteSerializer.serialize!(@route, :extended), status: :ok
  end

  private

  # Get all routes
  def find_all
    @routes = Route.paginate(page: params[:page] || 1, per_page: PER_PAGE)
  end

  # Search a single route by id
  def find_one
    @route = Route.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: { message: "Route with ID #{params[:id]} not found" } }, status: :not_found
  end

  # Generates pagination data
  def pagination_data
    {
      current_page: params[:page]&.to_i || 1,
      total_pages: (Route.all.length/(PER_PAGE*1.0)).ceil
    }
  end
end
