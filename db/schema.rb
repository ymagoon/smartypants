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

ActiveRecord::Schema.define(version: 2018_05_21_070400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "status", null: false
    t.float "price", default: 0.0
    t.string "shipping_address", null: false
    t.text "comment"
    t.bigint "bundle_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation"
    t.index ["bundle_id"], name: "index_bookings_on_bundle_id"
    t.index ["end_date"], name: "index_bookings_on_end_date"
    t.index ["start_date"], name: "index_bookings_on_start_date"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bundles", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.string "age_group", null: false
    t.float "price_per_day", null: false
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["user_id"], name: "index_bundles_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.string "color", null: false
    t.string "condition", null: false
    t.bigint "bundle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bundle_id"], name: "index_items_on_bundle_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bundle_id"
    t.index ["bundle_id"], name: "index_reviews_on_bundle_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "photo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "bundles"
  add_foreign_key "bookings", "users"
  add_foreign_key "bundles", "users"
  add_foreign_key "items", "bundles"
  add_foreign_key "reviews", "bundles"
  add_foreign_key "reviews", "users"
end
