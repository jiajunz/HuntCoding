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

ActiveRecord::Schema.define(version: 20131007004054) do

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
  end

  create_table "submissions", force: true do |t|
    t.text     "code"
    t.integer  "user_id"
    t.integer  "ojproblem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result"
    t.integer  "oj_problem_id"
    t.text     "result_detail"
  end

  add_index "submissions", ["oj_problem_id", "created_at"], name: "index_submissions_on_oj_problem_id_and_created_at"
  add_index "submissions", ["ojproblem_id", "created_at"], name: "index_submissions_on_ojproblem_id_and_created_at"

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
