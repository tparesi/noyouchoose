class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :yelp_id, null: false

      t.timestamps null: false
    end

    add_index :restaurants, :yelp_id
  end
end
