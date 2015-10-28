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

ActiveRecord::Schema.define(version: 20151027164155) do

  create_table "crono_jobs", force: :cascade do |t|
    t.string   "job_id",            null: false
    t.text     "log"
    t.datetime "last_performed_at"
    t.boolean  "healthy"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "crono_jobs", ["job_id"], name: "index_crono_jobs_on_job_id", unique: true

  create_table "delayed_jobs", force: :cascade do |t|
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

  create_table "lights", force: :cascade do |t|
    t.string   "name",                            null: false
    t.text     "desc"
    t.string   "state",           default: "red"
    t.string   "text",            default: "",    null: false
    t.string   "default_red"
    t.string   "default_yellow"
    t.string   "default_green"
    t.integer  "operators_count", default: 0
    t.integer  "watchers_count",  default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "lights", ["name"], name: "index_lights_on_name"

  create_table "operators", force: :cascade do |t|
    t.integer  "light_id"
    t.integer  "user_id"
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "operators", ["light_id"], name: "index_operators_on_light_id"
  add_index "operators", ["user_id"], name: "index_operators_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.integer  "light_id"
    t.integer  "user_id"
    t.string   "state",      default: "green"
    t.string   "text"
    t.boolean  "active",     default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "requests", ["light_id"], name: "index_requests_on_light_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "name"
    t.boolean  "admin",            default: false
    t.integer  "operators_count",  default: 0
    t.integer  "watchers_count",   default: 0
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "watchers", force: :cascade do |t|
    t.integer  "light_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "watchers", ["light_id"], name: "index_watchers_on_light_id"
  add_index "watchers", ["user_id"], name: "index_watchers_on_user_id"

end
