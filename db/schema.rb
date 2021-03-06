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

ActiveRecord::Schema.define(version: 20170929013451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "meal_name"
    t.integer "calories"
    t.boolean "healthy"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "on"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name_of_exercise"
    t.integer "duration"
    t.integer "distance"
    t.integer "repititions"
    t.string "exercise_category"
    t.integer "calories_burned"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "on"
    t.integer "weight"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "goal_type"
    t.string "description"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "on"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "start_weight"
  end

  add_foreign_key "diets", "users"
  add_foreign_key "exercises", "users"
  add_foreign_key "goals", "users"
end
