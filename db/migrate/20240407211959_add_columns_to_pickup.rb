# frozen_string_literal: true

class AddColumnsToPickup < ActiveRecord::Migration[7.1]
  def change
    add_column :pickups, :token, :string, null: false

    add_column :pickups, :state, :string, null: false
    add_column :pickups, :picked_up_at, :datetime
    add_column :pickups, :postponed_at, :datetime
    add_column :pickups, :cancelled_at, :datetime
  end
end
