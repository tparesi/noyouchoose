class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :restaurant_id, null: false
      t.integer :plan_id, null: false

      t.timestamps null: false
    end

    add_index :matches, [:restaurant_id, :plan_id], unique: true
  end
end
