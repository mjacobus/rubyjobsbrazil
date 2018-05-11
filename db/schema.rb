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

ActiveRecord::Schema.define(version: 2018_05_11_210610) do

  create_table "articles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.boolean "published", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "cities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "short"
    t.integer "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "jobs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "how_to_apply"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "open", default: true
    t.integer "city_id"
    t.index ["city_id"], name: "index_jobs_on_city_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "jobs_tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "job_id"
    t.integer "tag_id"
    t.index ["job_id", "tag_id"], name: "index_jobs_tags_on_job_id_and_tag_id", unique: true
    t.index ["job_id"], name: "index_jobs_tags_on_job_id"
    t.index ["tag_id"], name: "index_jobs_tags_on_tag_id"
  end

  create_table "states", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "short"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sequence", default: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "provider"
    t.string "uid"
    t.text "provider_data"
    t.string "name"
    t.boolean "admin", default: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

end
