class AddColumnsToDelivery < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :token, :string

    add_column :deliveries, :state, :string
    add_column :deliveries, :delivered_at, :datetime
    add_column :deliveries, :postponed_at, :datetime
    add_column :deliveries, :rejected_at, :datetime

    add_column :deliveries, :receiver_name, :string
    add_column :deliveries, :receiver_phone, :string
    add_column :deliveries, :receiver_legal_id, :string
    add_column :deliveries, :proof_of_delivery, :string
  end
end
