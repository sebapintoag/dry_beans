class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.belongs_to :route, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
