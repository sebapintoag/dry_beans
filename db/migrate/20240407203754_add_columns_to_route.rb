class AddColumnsToRoute < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :code, :string

    add_column :routes, :starting_point, :string
    add_column :routes, :destination_point, :string
    add_column :routes, :vehicle_plate, :string

    add_column :routes, :state, :string
    add_column :routes, :approved_at, :datetime
    add_column :routes, :started_at, :datetime
    add_column :routes, :finished_at, :datetime
    add_column :routes, :cancelled_at, :datetime
  end
end
