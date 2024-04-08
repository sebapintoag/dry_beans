# frozen_string_literal: true

module Tokenable
  require 'securerandom'

  extend ActiveSupport::Concern

  included do
    def generate_token(attribute_name = 'token', prefix = '')
      return if self[attribute_name].present?

      token = "#{prefix}#{SecureRandom.alphanumeric(6).upcase}"
      self[attribute_name] = token
    end
  end
end
