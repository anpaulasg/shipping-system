# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_19_010509) do
  create_table "close_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "delivery_date"
    t.integer "delay", default: 0
    t.integer "delay_reason", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_close_orders_on_order_id"
  end

  create_table "consult_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "order_shipping_id", null: false
    t.integer "close_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["close_order_id"], name: "index_consult_orders_on_close_order_id"
    t.index ["order_id"], name: "index_consult_orders_on_order_id"
    t.index ["order_shipping_id"], name: "index_consult_orders_on_order_shipping_id"
  end

  create_table "delivery_modes", force: :cascade do |t|
    t.string "name"
    t.float "minimum_distance"
    t.float "maximum_distance"
    t.float "minimum_weight"
    t.float "maximum_weight"
    t.float "initial_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delivery_mode_id", null: false
    t.index ["delivery_mode_id"], name: "index_delivery_times_on_delivery_mode_id"
  end

  create_table "order_shippings", force: :cascade do |t|
    t.float "final_price"
    t.integer "final_term"
    t.integer "order_id", null: false
    t.integer "delivery_mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chosen_vehicle"
    t.index ["delivery_mode_id"], name: "index_order_shippings_on_delivery_mode_id"
    t.index ["order_id"], name: "index_order_shippings_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "sender_address"
    t.string "receiver_address"
    t.integer "distance"
    t.string "product_code"
    t.integer "weight"
    t.integer "width"
    t.integer "height"
    t.string "receiver_name"
    t.string "delivery_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
  end

  create_table "price_distances", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "delivery_mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "distance_price"
    t.index ["delivery_mode_id"], name: "index_price_distances_on_delivery_mode_id"
  end

  create_table "price_weights", force: :cascade do |t|
    t.integer "min_weight"
    t.integer "max_weight"
    t.decimal "weight_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delivery_mode_id", null: false
    t.index ["delivery_mode_id"], name: "index_price_weights_on_delivery_mode_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "fabrication_year"
    t.float "maximum_capacity"
    t.integer "delivery_mode_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_mode_id"], name: "index_vehicles_on_delivery_mode_id"
  end

  add_foreign_key "close_orders", "orders"
  add_foreign_key "consult_orders", "close_orders"
  add_foreign_key "consult_orders", "order_shippings"
  add_foreign_key "consult_orders", "orders"
  add_foreign_key "delivery_times", "delivery_modes"
  add_foreign_key "order_shippings", "delivery_modes"
  add_foreign_key "order_shippings", "orders"
  add_foreign_key "price_distances", "delivery_modes"
  add_foreign_key "price_weights", "delivery_modes"
  add_foreign_key "vehicles", "delivery_modes"
end
