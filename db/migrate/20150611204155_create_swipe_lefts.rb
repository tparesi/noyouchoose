class CreateSwipeLefts < ActiveRecord::Migration
  def change
    create_table :swipe_lefts do |t|
      t.integer :user_id, null: false
      t.integer :potential_restaurant_id, null: false

      t.timestamps null: false
    end

    add_index :swipe_lefts, :user_id
    add_index :swipe_lefts, :potential_restaurant_id
    add_index :swipe_lefts, [:potential_restaurant_id, :user_id], unique: true
  end
end
