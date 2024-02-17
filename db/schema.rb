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

ActiveRecord::Schema[7.1].define(version: 2023_03_26_085546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "account_id", null: false
    t.index ["account_id", "name"], name: "index_groups_on_account_id_and_name", unique: true
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "name", null: false
    t.integer "position"
    t.integer "total", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
    t.boolean "temporary", default: false
    t.string "url"
    t.boolean "later", default: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_items_on_account_id"
    t.index ["group_id", "name"], name: "index_items_on_group_id_and_name", unique: true
    t.index ["group_id"], name: "index_items_on_group_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.string "confirmation_sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferences_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "groups", "accounts"
  add_foreign_key "items", "accounts"
  add_foreign_key "items", "groups"
  add_foreign_key "preferences", "users"
  add_foreign_key "users", "accounts"
end
