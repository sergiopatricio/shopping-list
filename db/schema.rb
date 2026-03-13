# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2024_04_07_100752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "unaccent"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "position"
    t.datetime "updated_at", null: false
    t.index ["account_id", "name"], name: "index_groups_on_account_id_and_name", unique: true
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.bigint "group_id", null: false
    t.boolean "later", default: false
    t.string "name", null: false
    t.integer "position"
    t.boolean "temporary", default: false
    t.integer "total", default: 0
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["account_id"], name: "index_items_on_account_id"
    t.index ["group_id", "name"], name: "index_items_on_group_id_and_name", unique: true
    t.index ["group_id"], name: "index_items_on_group_id"
  end

  create_table "user_configurations", force: :cascade do |t|
    t.string "confirmation_sort", default: "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_user_configurations_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at", precision: nil
    t.inet "last_sign_in_ip"
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "groups", "accounts"
  add_foreign_key "items", "accounts"
  add_foreign_key "items", "groups"
  add_foreign_key "user_configurations", "users"
  add_foreign_key "users", "accounts"
end
