# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150609212748) do

  create_table "cuisines", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "zipcode",                null: false
    t.string   "time",                   null: false
    t.integer  "min_price",  default: 1, null: false
    t.integer  "max_price",  default: 5, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plans_cuisines", force: :cascade do |t|
    t.integer  "plan_id",    null: false
    t.integer  "cuisine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plans_cuisines", ["cuisine_id"], name: "index_plans_cuisines_on_cuisine_id"
  add_index "plans_cuisines", ["plan_id", "cuisine_id"], name: "index_plans_cuisines_on_plan_id_and_cuisine_id", unique: true
  add_index "plans_cuisines", ["plan_id"], name: "index_plans_cuisines_on_plan_id"

  create_table "potential_restaurants", force: :cascade do |t|
    t.integer  "restaurant_id", null: false
    t.integer  "plan_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "potential_restaurants", ["plan_id"], name: "index_potential_restaurants_on_plan_id"
  add_index "potential_restaurants", ["restaurant_id", "plan_id"], name: "index_potential_restaurants_on_restaurant_id_and_plan_id", unique: true
  add_index "potential_restaurants", ["restaurant_id"], name: "index_potential_restaurants_on_restaurant_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "yelp_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurants", ["yelp_id"], name: "index_restaurants_on_yelp_id"

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "token",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", unique: true
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "swipe_rights", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "potential_restaurant_id", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "swipe_rights", ["potential_restaurant_id", "user_id"], name: "index_swipe_rights_on_potential_restaurant_id_and_user_id", unique: true
  add_index "swipe_rights", ["potential_restaurant_id"], name: "index_swipe_rights_on_potential_restaurant_id"
  add_index "swipe_rights", ["user_id"], name: "index_swipe_rights_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "phone_number",    null: false
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true

  create_table "users_plans", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "plan_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_plans", ["plan_id"], name: "index_users_plans_on_plan_id"
  add_index "users_plans", ["user_id", "plan_id"], name: "index_users_plans_on_user_id_and_plan_id", unique: true
  add_index "users_plans", ["user_id"], name: "index_users_plans_on_user_id"

end
