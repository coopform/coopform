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

ActiveRecord::Schema.define(version: 20200524164602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answears", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "number"
    t.string "value", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 400
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f_answears", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "number"
    t.string "value", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.string "f_one", limit: 50
    t.string "f_two", limit: 50
    t.string "f_three", limit: 50
    t.string "f_four", limit: 50
    t.string "f_five", limit: 50
    t.string "f_six", limit: 50
    t.string "f_seven", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id"
    t.string "person", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name", limit: 30
    t.string "surname", limit: 30
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
