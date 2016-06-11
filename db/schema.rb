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

ActiveRecord::Schema.define(version: 20160610192249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "visitors",      default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "region_id"
    t.integer  "coordinate_id"
    t.string   "images",        default: [],              array: true
    t.integer  "country_id"
  end

  add_index "cities", ["coordinate_id"], name: "index_cities_on_coordinate_id", using: :btree
  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["region_id"], name: "index_cities_on_region_id", using: :btree

  create_table "coordinates", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "visitors",      default: 0
    t.text     "information"
    t.text     "history"
    t.text     "economic"
    t.text     "culture"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "coordinate_id"
    t.string   "images",        default: [],              array: true
  end

  add_index "countries", ["coordinate_id"], name: "index_countries_on_coordinate_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "photo_reports", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "visitors",    default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "images",      default: [],              array: true
    t.integer  "city_id"
    t.integer  "country_id"
    t.integer  "user_id"
  end

  add_index "photo_reports", ["city_id"], name: "index_photo_reports_on_city_id", using: :btree
  add_index "photo_reports", ["country_id"], name: "index_photo_reports_on_country_id", using: :btree
  add_index "photo_reports", ["user_id"], name: "index_photo_reports_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "visitors",      default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "images",        default: [],              array: true
    t.integer  "city_id"
    t.integer  "coordinate_id"
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree
  add_index "places", ["coordinate_id"], name: "index_places_on_coordinate_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "visitors",      default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "coordinate_id"
    t.string   "images",        default: [],              array: true
    t.integer  "country_id"
  end

  add_index "regions", ["coordinate_id"], name: "index_regions_on_coordinate_id", using: :btree
  add_index "regions", ["country_id"], name: "index_regions_on_country_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "login",                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cities", "coordinates"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "regions"
  add_foreign_key "countries", "coordinates"
  add_foreign_key "identities", "users"
  add_foreign_key "photo_reports", "cities"
  add_foreign_key "photo_reports", "countries"
  add_foreign_key "photo_reports", "users"
  add_foreign_key "places", "cities"
  add_foreign_key "places", "coordinates"
  add_foreign_key "regions", "coordinates"
  add_foreign_key "regions", "countries"
end
