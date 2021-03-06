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

ActiveRecord::Schema.define(version: 2021_11_26_071140) do

  create_table "applied_fors", force: :cascade do |t|
    t.integer "status"
    t.integer "job_id", null: false
    t.integer "jseeker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_applied_fors_on_job_id"
    t.index ["jseeker_id"], name: "index_applied_fors_on_jseeker_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_title"
    t.text "job_des"
    t.integer "job_percat"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "jseekers", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.integer "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "qdegree"
    t.text "jdes"
    t.boolean "verified", default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cname"
    t.string "cinumber"
    t.string "mobileno"
    t.boolean "verified", default: false, null: false
  end

  add_foreign_key "applied_fors", "jobs"
  add_foreign_key "applied_fors", "jseekers"
  add_foreign_key "jobs", "users"
end
