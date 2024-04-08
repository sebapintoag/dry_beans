# frozen_string_literal: true

module Serializable
  extend ActiveSupport::Concern

  class_methods do
    def serialize!(resource, view_name = :extended, meta_content = nil)
      root_name = resource.respond_to?(:size) ? resource.first.class.name.downcase.pluralize : resource.class.name.downcase
      render(resource, root: root_name, view: view_name, meta: meta_content)
    end
  end
end
