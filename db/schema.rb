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

ActiveRecord::Schema.define(version: 20180125213804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "registration_number"
    t.string "brand"
    t.string "model"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_cars_on_deleted_at"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "name", null: false
    t.integer "mileage"
    t.date "warranty_date"
    t.text "note"
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "invoice"
    t.index ["car_id"], name: "index_maintenances_on_car_id"
    t.index ["deleted_at"], name: "index_maintenances_on_deleted_at"
  end

  create_table "mileages", force: :cascade do |t|
    t.integer "meter_status", null: false
    t.bigint "car_id"
    t.date "date", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_mileages_on_car_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "name", null: false
    t.date "reminder_date"
    t.integer "mileage"
    t.text "note"
    t.bigint "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.date "sended"
    t.date "archived"
    t.index ["car_id"], name: "index_reminders_on_car_id"
    t.index ["deleted_at"], name: "index_reminders_on_deleted_at"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name", null: false
    t.string "type", default: "RegularUser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.datetime "deleted_at"
    t.integer "language", default: 0, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "latitude"
    t.string "longitude"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["language"], name: "index_users_on_language"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.integer "kind", null: false
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_workshops_on_kind"
    t.index ["latitude"], name: "index_workshops_on_latitude"
    t.index ["longitude"], name: "index_workshops_on_longitude"
  end

  add_foreign_key "cars", "users"
  add_foreign_key "maintenances", "cars"
  add_foreign_key "mileages", "cars"
  add_foreign_key "reminders", "cars"
end
