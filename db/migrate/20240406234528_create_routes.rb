class CreateRoutes < ActiveRecord::Migration[7.1]
  def up
    create_table :routes do |t|

      t.timestamps
    end
  end

  
  def down
    drop_table :routes
  end
end
