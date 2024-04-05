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

ActiveRecord::Schema[7.0].define(version: 2024_04_04_193312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.bigint "external_datum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_datum_id"], name: "index_alerts_on_external_datum_id"
  end

  create_table "external_data", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.citext "ext_username"
    t.citext "ext_email", default: "", null: false
    t.bigint "organization_id", null: false
    t.boolean "main_email"
    t.integer "alerts_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ext_email"], name: "index_external_data_on_ext_email"
    t.index ["ext_username"], name: "index_external_data_on_ext_username"
    t.index ["organization_id"], name: "index_external_data_on_organization_id"
    t.index ["user_id"], name: "index_external_data_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.citext "name"
    t.integer "external_data_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.citext "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username", null: false
    t.citext "name"
    t.integer "external_data_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "alerts", "external_data"
  add_foreign_key "external_data", "organizations"
  add_foreign_key "external_data", "users"
end
