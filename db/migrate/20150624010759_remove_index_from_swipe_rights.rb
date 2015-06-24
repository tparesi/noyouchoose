class RemoveIndexFromSwipeRights < ActiveRecord::Migration
  def change
    remove_index :swipe_rights, [:potential_restaurant_id, :user_id]
    remove_index :swipe_lefts, [:potential_restaurant_id, :user_id]
  end
end
