class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|
      t.belongs_to :trip, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
