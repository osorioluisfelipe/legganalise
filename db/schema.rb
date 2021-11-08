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

ActiveRecord::Schema.define(version: 2021_11_08_151623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lab_analyses", force: :cascade do |t|
    t.string "analysis_name"
    t.bigint "request_id", null: false
    t.bigint "sample_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_id"], name: "index_lab_analyses_on_request_id"
    t.index ["sample_id"], name: "index_lab_analyses_on_sample_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "sample_quantity"
    t.datetime "request_date", default: "2021-11-05 18:02:50"
    t.datetime "approval_date"
    t.datetime "results_date"
    t.string "project_name"
    t.text "project_summary"
    t.boolean "request_approval", default: false
    t.boolean "results_ready", default: false
    t.boolean "results_approval", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "sample_name"
    t.string "sample_matrix"
    t.string "sample_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "organization"
    t.boolean "admin", default: false
    t.boolean "tecnician", default: false
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lab_analyses", "requests"
  add_foreign_key "lab_analyses", "samples"
  add_foreign_key "requests", "users"
  add_foreign_key "samples", "users"
end
