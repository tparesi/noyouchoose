class CreatePotentialRestaurants < ActiveRecord::Migration
  def change
    create_table :potential_restaurants do |t|
      t.integer :restaurant_id, null: false
      t.integer :plan_id, null: false

      t.timestamps null: false
    end

    add_index :potential_restaurants, :restaurant_id
    add_index :potential_restaurants, :plan_id
    add_index :potential_restaurants, [:restaurant_id, :plan_id], unique: true
  end
end
