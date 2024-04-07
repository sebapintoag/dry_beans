class CreateMoves < ActiveRecord::Migration[7.1]
  def up
    create_table :moves do |t|
      t.belongs_to :trip, null: false, index: true, foreign_key: true
      t.bigint  :movable_id, null: false
      t.string  :movable_type, null: false
      t.timestamps
    end
    add_index :moves, [:movable_type, :movable_id]
  end

  def down
    drop_table :moves
  end
end
