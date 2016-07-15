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

ActiveRecord::Schema.define(version: 20150815205251) do

  create_table "recruiter_articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.boolean  "published",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "recruiter_articles", ["published"], name: "index_recruiter_articles_on_published", using: :btree
  add_index "recruiter_articles", ["user_id"], name: "index_recruiter_articles_on_user_id", using: :btree

  create_table "recruiter_cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "short",      limit: 255
    t.integer  "state_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_cities", ["state_id"], name: "index_recruiter_cities_on_state_id", using: :btree

  create_table "recruiter_jobs", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.text     "how_to_apply", limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",                       default: true
    t.integer  "city_id",      limit: 4
  end

  add_index "recruiter_jobs", ["city_id"], name: "index_recruiter_jobs_on_city_id", using: :btree
  add_index "recruiter_jobs", ["user_id"], name: "index_recruiter_jobs_on_user_id", using: :btree

  create_table "recruiter_jobs_tags", force: :cascade do |t|
    t.integer "job_id", limit: 4
    t.integer "tag_id", limit: 4
  end

  add_index "recruiter_jobs_tags", ["job_id", "tag_id"], name: "index_recruiter_jobs_tags_on_job_id_and_tag_id", unique: true, using: :btree
  add_index "recruiter_jobs_tags", ["job_id"], name: "index_recruiter_jobs_tags_on_job_id", using: :btree
  add_index "recruiter_jobs_tags", ["tag_id"], name: "index_recruiter_jobs_tags_on_tag_id", using: :btree

  create_table "recruiter_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "short",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_states", ["name"], name: "index_recruiter_states_on_name", unique: true, using: :btree

  create_table "recruiter_tags", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "sequence",    limit: 4,     default: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recruiter_tags", ["name"], name: "index_recruiter_tags_on_name", unique: true, using: :btree

  create_table "recruiter_users", force: :cascade do |t|
    t.string   "email",               limit: 255
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",            limit: 255
    t.string   "uid",                 limit: 255
    t.text     "provider_data",       limit: 65535
    t.string   "name",                limit: 255
    t.boolean  "admin",                             default: false
  end

  add_index "recruiter_users", ["provider", "uid"], name: "index_recruiter_users_on_provider_and_uid", unique: true, using: :btree

end
