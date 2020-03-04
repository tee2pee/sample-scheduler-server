# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_29_155555) do

  create_table "calendars", force: :cascade do |t|
    t.string "title"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "calendar_id"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["calendar_id"], name: "index_relationships_on_calendar_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "calendar_id"
    t.datetime "fr_datetime"
    t.datetime "to_datetime"
    t.string "title"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["calendar_id"], name: "index_schedules_on_calendar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
