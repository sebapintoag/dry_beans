# frozen_string_literal: true

# Module that includes auto generation of tokens into models
module Tokenable
  require 'securerandom'

  extend ActiveSupport::Concern

  included do
    # Generates a token if none were provided
    # @param attribute_name [String] name of the attribute that stores the token
    # @param prefix [String] prefix of the token
    def generate_token(attribute_name = 'token', prefix = '')
      return if self[attribute_name].present?

      token = "#{prefix}#{SecureRandom.alphanumeric(6).upcase}"
      self[attribute_name] = token
    end
  end
end
