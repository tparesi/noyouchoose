class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :user_id, null: false
      t.integer :potential_restaurant_id, null: false
      t.boolean :swipe_right?, null: false

      t.timestamps null: false
    end

    add_index :swipes, :user_id
    add_index :swipes, :potential_restaurant_id
    add_index :swipes, [:potential_restaurant_id, :user_id], unique: true
  end
end
