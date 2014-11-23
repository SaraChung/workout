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

ActiveRecord::Schema.define(version: 20141123121311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "exercises", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises_trainers", id: false, force: true do |t|
    t.integer  "trainer_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "notifications_type_id"
    t.integer  "subject_id"
    t.integer  "obj_id"
    t.string   "title"
    t.string   "short_message"
    t.string   "long_message"
    t.boolean  "is_read",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_hash",           default: ""
    t.string   "url",                   default: ""
  end

  create_table "notifications_types", force: true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "object"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles_trainers", force: true do |t|
    t.integer  "trainer_id",         null: false
    t.text     "interests"
    t.text     "about"
    t.string   "workout_quotes"
    t.datetime "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profiles_users", force: true do |t|
    t.integer  "user_id",            null: false
    t.text     "interests"
    t.text     "about"
    t.string   "quotes"
    t.datetime "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "trainer_id"
    t.integer  "user_id"
    t.string   "rating",                              null: false
    t.string   "comments",   default: "No comments."
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "trainer_id"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "from_when"
    t.datetime "to_when"
    t.string   "address",     default: ""
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_private"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "phone_number",           default: ""
    t.string   "address",                default: ""
    t.float    "latitude",               default: 0.0
    t.float    "longitude",              default: 0.0
    t.boolean  "gender",                 default: false
    t.boolean  "is_trainer",             default: true
  end

  add_index "trainers", ["email"], name: "index_trainers_on_email", unique: true, using: :btree
  add_index "trainers", ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "phone_number",           default: ""
    t.string   "address",                default: ""
    t.float    "latitude",               default: 0.0
    t.float    "longitude",              default: 0.0
    t.boolean  "gender",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
