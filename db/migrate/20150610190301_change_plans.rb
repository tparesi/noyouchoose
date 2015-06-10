class ChangePlans < ActiveRecord::Migration
  def change
    remove_column :plans, :zipcode, :string
    remove_column :plans, :min_price, :integer
    remove_column :plans, :max_price, :integer
    add_column :plans, :name, :string
    change_column :plans, :name, :string, null: false
  end
end
