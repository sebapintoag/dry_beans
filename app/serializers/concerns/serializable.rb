module Serializable
    extend ActiveSupport::Concern
  
    class_methods do
        def serialize!(resource, view_name = :extended)
            root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
            self.render(resource, root: root_name, view: view_name)
          end
      end
end