class CreateUsersPlans < ActiveRecord::Migration
  def change
    create_table :users_plans do |t|
      t.integer :user_id, null: false
      t.integer :plan_id, null: false
      t.timestamps null: false
    end

    add_index :users_plans, :user_id
    add_index :users_plans, :plan_id
    add_index :users_plans, [:user_id, :plan_id], unique: true
  end
end
