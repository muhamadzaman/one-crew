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

ActiveRecord::Schema.define(version: 2022_02_07_091736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimate_details", force: :cascade do |t|
    t.string "job", null: false
    t.decimal "units", null: false
    t.decimal "time"
    t.decimal "rate", null: false
    t.decimal "cost", null: false
    t.decimal "margin_multiple", null: false
    t.decimal "bid", null: false
    t.bigint "estimate_id", null: false
    t.string "estimate_category", null: false
    t.string "unit_of_measure", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["estimate_id"], name: "index_estimate_details_on_estimate_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_estimates_on_job_id"
    t.index ["user_id"], name: "index_estimates_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_jobs_on_name"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.string "nickname"
    t.string "image"
    t.string "email", null: false
    t.bigint "role_id", null: false
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "estimate_details", "estimates"
  add_foreign_key "estimates", "jobs"
  add_foreign_key "estimates", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "users", "roles"
end
