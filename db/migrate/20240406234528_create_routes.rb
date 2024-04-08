# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes, &:timestamps
  end
end
