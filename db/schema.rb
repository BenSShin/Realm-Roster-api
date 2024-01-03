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

ActiveRecord::Schema[7.0].define(version: 2024_01_03_181131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id", default: 1
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.string "race"
    t.integer "level"
    t.string "character_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "group_id"
    t.date "date"
    t.time "time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "higher_level"
    t.string "range"
    t.text "components", default: [], array: true
    t.string "material"
    t.boolean "ritual"
    t.string "duration"
    t.boolean "concentration"
    t.string "casting_time"
    t.string "level"
    t.string "dc_type"
    t.string "attack_type"
    t.string "damage_type"
    t.string "school"
    t.string "classes", default: [], array: true
    t.string "subclasses", default: [], array: true
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "area_of_effect"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
