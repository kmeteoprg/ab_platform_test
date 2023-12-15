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

ActiveRecord::Schema[7.0].define(version: 2023_12_15_185332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ab_tests", force: :cascade do |t|
    t.string "title"
    t.string "options", default: [], array: true
    t.float "probabilities", default: [], array: true
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_devices_on_token", unique: true
  end

  create_table "tests_values", id: false, force: :cascade do |t|
    t.bigint "ab_test_id", null: false
    t.bigint "device_id", null: false
    t.string "option"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ab_test_id", "device_id"], name: "index_tests_values_on_ab_test_id_and_device_id"
    t.index ["device_id", "ab_test_id"], name: "index_tests_values_on_device_id_and_ab_test_id"
  end

end
