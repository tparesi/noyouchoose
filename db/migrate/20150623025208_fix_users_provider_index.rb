class FixUsersProviderIndex < ActiveRecord::Migration
  def change
    remove_index :users, [:provider, :uid]
    add_index :users, [:provider, :uid], unique: true
  end
end
