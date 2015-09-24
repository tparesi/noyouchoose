class ChangeSessionTokenToStringOnSessions < ActiveRecord::Migration
  def change
    Session.destroy_all
    change_column :sessions, :token, :string
  end
end
