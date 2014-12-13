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

ActiveRecord::Schema.define(version: 20141213143651) do

  create_table "recruiter_articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.boolean  "published",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_articles", ["user_id"], name: "index_recruiter_articles_on_user_id", using: :btree

  create_table "recruiter_cities", force: true do |t|
    t.string   "name"
    t.string   "short"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_cities", ["state_id"], name: "index_recruiter_cities_on_state_id", using: :btree

  create_table "recruiter_jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "how_to_apply"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",         default: true
    t.integer  "city_id"
  end

  add_index "recruiter_jobs", ["city_id"], name: "index_recruiter_jobs_on_city_id", using: :btree
  add_index "recruiter_jobs", ["user_id"], name: "index_recruiter_jobs_on_user_id", using: :btree

  create_table "recruiter_jobs_tags", force: true do |t|
    t.integer "job_id"
    t.integer "tag_id"
  end

  add_index "recruiter_jobs_tags", ["job_id", "tag_id"], name: "index_recruiter_jobs_tags_on_job_id_and_tag_id", unique: true, using: :btree
  add_index "recruiter_jobs_tags", ["job_id"], name: "index_recruiter_jobs_tags_on_job_id", using: :btree
  add_index "recruiter_jobs_tags", ["tag_id"], name: "index_recruiter_jobs_tags_on_tag_id", using: :btree

  create_table "recruiter_states", force: true do |t|
    t.string   "name"
    t.string   "short"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_states", ["name"], name: "index_recruiter_states_on_name", unique: true, using: :btree

  create_table "recruiter_tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequence",    default: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_tags", ["name"], name: "index_recruiter_tags_on_name", unique: true, using: :btree

  create_table "recruiter_users", force: true do |t|
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.text     "provider_data"
    t.string   "name"
  end

  add_index "recruiter_users", ["provider", "uid"], name: "index_recruiter_users_on_provider_and_uid", unique: true, using: :btree

end
