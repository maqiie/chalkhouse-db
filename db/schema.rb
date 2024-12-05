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

ActiveRecord::Schema[7.0].define(version: 2024_12_03_163308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.date "date"
    t.time "time"
    t.integer "guests"
    t.bigint "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_fee"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "duration"
    t.index ["table_id"], name: "index_bookings_on_table_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "player"
    t.string "phone"
    t.string "game"
    t.decimal "price"
    t.boolean "accepted"
    t.datetime "expiration_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_seat_bookings", force: :cascade do |t|
    t.string "seat_number", null: false
    t.integer "match_id", null: false
    t.date "booking_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_number", "match_id"], name: "index_match_seat_bookings_on_seat_number_and_match_id", unique: true
    t.index ["user_id"], name: "index_match_seat_bookings_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "deadline"
    t.integer "max_players"
    t.integer "registered_players_count"
    t.decimal "registration_fee"
    t.decimal "prize"
    t.string "first_place"
    t.string "second_place"
    t.string "third_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "tables"
  add_foreign_key "match_seat_bookings", "users"
end
