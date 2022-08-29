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

ActiveRecord::Schema.define(version: 2022_08_27_183654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.bigint "user_id", null: false
    t.bigint "nanny_id", null: false
    t.date "end_date"
    t.string "status"
    t.float "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nanny_id"], name: "index_bookings_on_nanny_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "nannies", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "address"
    t.string "tel"
    t.string "email"
    t.string "description"
    t.integer "experience"
    t.integer "capacity"
    t.date "birthday"
    t.string "kids_category"
    t.string "sex"
    t.boolean "at_user_place"
    t.boolean "at_your_place"
    t.integer "price_per_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_nannies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.string "address"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "nannies"
  add_foreign_key "bookings", "users"
  add_foreign_key "nannies", "users"
end
