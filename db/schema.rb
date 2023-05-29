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

ActiveRecord::Schema[7.0].define(version: 2023_05_29_220814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifications", force: :cascade do |t|
    t.bigint "player_id"
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "message"], name: "index_notifications_on_player_id_and_message", unique: true
    t.index ["player_id"], name: "index_notifications_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "nationality", null: false
    t.string "position", null: false
    t.integer "number"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_players_on_name"
    t.index ["nationality"], name: "index_players_on_nationality"
    t.index ["position"], name: "index_players_on_position"
  end

  create_table "subscribe_notifications", force: :cascade do |t|
    t.bigint "player_id"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "email"], name: "index_subscribe_notifications_on_player_id_and_email", unique: true
    t.index ["player_id"], name: "index_subscribe_notifications_on_player_id"
  end

  add_foreign_key "notifications", "players"
  add_foreign_key "subscribe_notifications", "players"
end
