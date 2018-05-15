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

ActiveRecord::Schema.define(version: 20180515185714) do

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "shop_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "occupation"
    t.string "images"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_customers_on_shop_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "destinable_type"
    t.integer "destinable_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destinable_type", "destinable_id"], name: "index_destinations_on_destinable_type_and_destinable_id"
  end

  create_table "freight_capacities", force: :cascade do |t|
    t.string "transportation_type"
    t.string "container_size"
    t.integer "service_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "volume"
    t.string "shippable_type"
    t.integer "shippable_id"
    t.index ["shippable_type", "shippable_id"], name: "index_freight_capacities_on_shippable_type_and_shippable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type"
    t.integer "locatable_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "proposal"
    t.integer "user_id"
    t.integer "customer_id"
    t.boolean "user_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by_id"
    t.text "message"
    t.boolean "customer_confirmation"
    t.string "status"
    t.index ["created_by_id"], name: "index_requests_on_created_by_id"
    t.index ["customer_id"], name: "index_requests_on_customer_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.integer "shop_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "destination"
    t.string "origin"
    t.index ["shop_id"], name: "index_shipments_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "occupation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
