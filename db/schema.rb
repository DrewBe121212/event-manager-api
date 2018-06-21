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

ActiveRecord::Schema.define(version: 20180620161136) do

  create_table "menus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "parent_id"
    t.string "title", limit: 100, null: false
    t.string "url", limit: 100, null: false
    t.string "icon", limit: 50
    t.string "authorize_perform", limit: 50
    t.string "authorize_on", limit: 50
    t.integer "sort", default: 0, null: false
    t.boolean "visible", default: true, null: false
    t.boolean "active", default: true, null: false
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["parent_id"], name: "index_menus_on_parent_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, null: false
    t.text "description"
    t.integer "sort", default: 0, null: false
    t.boolean "default", default: false, null: false
    t.boolean "active", default: true, null: false
    t.boolean "deleted", default: false, null: false
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 30, null: false
    t.string "email", limit: 100, null: false
    t.string "password_digest", limit: 100, null: false
    t.string "first_name", limit: 50, null: false
    t.string "middle_name", limit: 50
    t.string "last_name", limit: 50, null: false
    t.boolean "sso", default: false, null: false
    t.boolean "active", default: false, null: false
    t.string "reset_password_token", limit: 100
    t.datetime "reset_password_sent_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "confirmation_token", limit: 100
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email", limit: 100
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
