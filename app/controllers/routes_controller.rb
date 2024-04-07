class RoutesController < ApplicationController
    before_action :find_one, only: :show

    def index
        
    end

    def show

    end

    private

    def find_all
        @routes = Route.all
    end

    def find_one
        @route = Route.find_by(params[:route_id])
    end
end
