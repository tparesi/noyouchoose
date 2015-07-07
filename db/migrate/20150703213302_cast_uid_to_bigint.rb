class CastUidToBigint < ActiveRecord::Migration
  def change
    change_column :users, :uid, 'bigint USING CAST(uid AS bigint)'
  end
end
