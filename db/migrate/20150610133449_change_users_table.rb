class ChangeUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :phone_number
    remove_column :users, :name
    remove_column :users, :password_digest

    add_column :users, :provider, :string
    add_column :users, :uid, :bigint

    add_index :users, [:provider, :uid], unique: true
  end
end
