class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :zipcode, null: false
      t.string :time, null: false
      t.integer :min_price, null: false, default: 1
      t.integer :max_price, null: false, default: 5

      t.timestamps null: false
    end
  end
end
