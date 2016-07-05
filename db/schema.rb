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

ActiveRecord::Schema.define(version: 20160624161041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "volume"
    t.decimal  "price_kg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
    t.integer  "steel_type_id"
    t.integer  "steel_width_id"
    t.integer  "steel_finish_id"
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["steel_finish_id"], name: "index_items_on_steel_finish_id", using: :btree
  add_index "items", ["steel_type_id"], name: "index_items_on_steel_type_id", using: :btree
  add_index "items", ["steel_width_id"], name: "index_items_on_steel_width_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.decimal  "transport_cost"
    t.decimal  "cost"
    t.string   "status",         default: "draft"
    t.text     "comment"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "steel_finishes", force: :cascade do |t|
    t.string   "finish"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steel_types", force: :cascade do |t|
    t.string   "steel_type"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steel_widths", force: :cascade do |t|
    t.string   "steel_type"
    t.decimal  "width"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "company"
    t.string   "country"
    t.string   "phone_num"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "items", "orders"
  add_foreign_key "items", "steel_finishes"
  add_foreign_key "items", "steel_types"
  add_foreign_key "items", "steel_widths"
  add_foreign_key "orders", "users"
end
