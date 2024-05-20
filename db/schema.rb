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

ActiveRecord::Schema[7.0].define(version: 2024_02_14_160313) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.float "weight"
    t.integer "reps"
    t.integer "sets"
    t.string "exerciseable_type", null: false
    t.bigint "exerciseable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movement_id", null: false
    t.index ["exerciseable_type", "exerciseable_id"], name: "index_exercises_on_exerciseable"
    t.index ["movement_id"], name: "index_exercises_on_movement_id"
  end

  create_table "goals", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.date "due_date"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.string "name"
    t.boolean "legs", default: false
    t.boolean "chest", default: false
    t.boolean "core", default: false
    t.boolean "back", default: false
    t.boolean "arms", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "workouts", force: :cascade do |t|
    t.text "notes"
    t.date "date"
    t.time "time"
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_workouts_on_gym_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercises", "movements"
  add_foreign_key "goals", "users"
  add_foreign_key "workouts", "gyms"
  add_foreign_key "workouts", "users"
end
