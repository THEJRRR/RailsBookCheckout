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

ActiveRecord::Schema.define(version: 20140829124520) do

  create_table "attachinary_files", force: true do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"

  create_table "book_reviews", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_reviews", ["book_id"], name: "index_book_reviews_on_book_id"
  add_index "book_reviews", ["user_id"], name: "index_book_reviews_on_user_id"

  create_table "books", force: true do |t|
    t.string   "author"
    t.string   "title"
    t.string   "status"
    t.string   "isbn"
    t.integer  "rating"
    t.string   "tags"
    t.string   "review"
    t.boolean  "active"
    t.datetime "approved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "user_id"
  end

  add_index "books", ["follower_id"], name: "index_books_on_follower_id"
  add_index "books", ["user_id"], name: "index_books_on_user_id"

  create_table "followers", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "followed_date"
  end

  create_table "ratings", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "reservations", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "reserved_date"
    t.datetime "return_date"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.boolean  "admin"
    t.integer  "follower_id"
    t.boolean  "banned_from_reviewing"
    t.boolean  "banned_from_rating"
    t.integer  "sign_in_counter"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["follower_id"], name: "index_users_on_follower_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
