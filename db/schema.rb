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

ActiveRecord::Schema.define(version: 20140616223351) do

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "short"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "how_to_apply"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",         default: true
    t.integer  "city_id"
  end

  add_index "jobs", ["city_id"], name: "index_jobs_on_city_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "jobs_tags", force: true do |t|
    t.integer "job_id"
    t.integer "tag_id"
  end

  add_index "jobs_tags", ["job_id", "tag_id"], name: "index_jobs_tags_on_job_id_and_tag_id", unique: true, using: :btree
  add_index "jobs_tags", ["job_id"], name: "index_jobs_tags_on_job_id", using: :btree
  add_index "jobs_tags", ["tag_id"], name: "index_jobs_tags_on_tag_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "short"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["name"], name: "index_states_on_name", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequence",    default: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
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

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
