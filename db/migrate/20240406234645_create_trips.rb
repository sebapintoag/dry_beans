class CreateTrips < ActiveRecord::Migration[7.1]
  def up
    create_table :trips do |t|
      t.belongs_to :route, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end

  
  def down
    drop_table :trips
  end
end
