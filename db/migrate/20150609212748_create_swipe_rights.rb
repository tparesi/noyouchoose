class CreateSwipeRights < ActiveRecord::Migration
  def change
    create_table :swipe_rights do |t|
      t.integer :user_id, null: false
      t.integer :potential_restaurant_id, null: false

      t.timestamps null: false
    end

    add_index :swipe_rights, :potential_restaurant_id
    add_index :swipe_rights, :user_id
    add_index :swipe_rights, [:potential_restaurant_id, :user_id], unique: true
  end
end
