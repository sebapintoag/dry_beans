class RouteSerializer < Blueprinter::Base
    identifier :id
  
    fields :created_at, :updated_at

    def self.serialize!(route)
      self.render(route, root: :route)
    end
  end