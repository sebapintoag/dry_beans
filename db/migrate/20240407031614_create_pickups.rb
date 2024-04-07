class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|

      t.timestamps
    end
  end
end
