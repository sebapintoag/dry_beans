# frozen_string_literal: true

class AddColumnsToTrip < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :code, :string, null: false

    add_column :trips, :destination_person_name, :string, null: false
    add_column :trips, :destination_person_phone, :string
    add_column :trips, :destination_address, :string, null: false
    add_column :trips, :destination_lat, :decimal
    add_column :trips, :destination_lng, :decimal

    add_column :trips, :state, :string, null: false
    add_column :trips, :started_at, :datetime
    add_column :trips, :finished_at, :datetime
    add_column :trips, :cancelled_at, :datetime

    add_column :trips, :estimated_arrival_at, :datetime
  end
end
