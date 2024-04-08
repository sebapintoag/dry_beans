class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.belongs_to :trip, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
