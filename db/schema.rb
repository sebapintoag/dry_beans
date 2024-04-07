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

ActiveRecord::Schema[7.1].define(version: 2024_04_07_211959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "state"
    t.datetime "delivered_at"
    t.datetime "postponed_at"
    t.datetime "rejected_at"
    t.string "receiver_name"
    t.string "receiver_phone"
    t.string "receiver_legal_id"
    t.string "proof_of_delivery"
    t.index ["trip_id"], name: "index_deliveries_on_trip_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "state"
    t.datetime "picked_up_at"
    t.datetime "postponed_at"
    t.datetime "cancelled_at"
    t.index ["trip_id"], name: "index_pickups_on_trip_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "starting_point"
    t.string "destination_point"
    t.string "vehicle_plate"
    t.string "state"
    t.datetime "approved_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "cancelled_at"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "destination_person_name"
    t.string "destination_person_phone"
    t.string "destination_address"
    t.decimal "destination_lat"
    t.decimal "destination_lng"
    t.string "state"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "cancelled_at"
    t.datetime "estimated_arrival_at"
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  add_foreign_key "deliveries", "trips"
  add_foreign_key "pickups", "trips"
  add_foreign_key "trips", "routes"
end
