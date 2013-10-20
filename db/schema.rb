# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131020011136) do

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "oj_problems", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "level"
    t.integer  "correct_submission"
    t.integer  "total_submission"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "testrunner"
    t.text     "stub"
    t.text     "pythontest"
    t.text     "pythonstub"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "solvedproblems", force: true do |t|
    t.integer  "oj_problem_id"
    t.integer  "user_id"
    t.boolean  "solved",        default: false
    t.integer  "faved"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solvedproblems", ["user_id", "oj_problem_id"], name: "index_solvedproblems_on_user_id_and_oj_problem_id"
  add_index "solvedproblems", ["user_id"], name: "index_solvedproblems_on_user_id"

  create_table "submissions", force: true do |t|
    t.text     "code"
    t.integer  "user_id"
    t.integer  "ojproblem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result"
    t.integer  "oj_problem_id"
    t.text     "result_detail"
    t.integer  "solvedproblem_id"
    t.integer  "pass"
    t.integer  "total"
    t.string   "language"
  end

  add_index "submissions", ["oj_problem_id", "created_at"], name: "index_submissions_on_oj_problem_id_and_created_at"
  add_index "submissions", ["ojproblem_id", "created_at"], name: "index_submissions_on_ojproblem_id_and_created_at"
  add_index "submissions", ["solvedproblem_id"], name: "index_submissions_on_solvedproblem_id"
  add_index "submissions", ["user_id", "created_at"], name: "index_submissions_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "coreuser",        default: false
  end

end
