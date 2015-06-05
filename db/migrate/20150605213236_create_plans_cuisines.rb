class CreatePlansCuisines < ActiveRecord::Migration
  def change
    create_table :plans_cuisines do |t|
      t.integer :plan_id, null: false
      t.integer :cuisine_id, null: false

      t.timestamps null: false
    end

    add_index :plans_cuisines, :plan_id
    add_index :plans_cuisines, :cuisine_id
    add_index :plans_cuisines, [:plan_id, :cuisine_id], unique: true
  end
end
