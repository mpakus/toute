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

ActiveRecord::Schema.define(version: 20130726082138) do

  create_table "categories", force: true do |t|
    t.string   "alias",      limit: 32
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["alias"], name: "index_categories_on_alias", using: :btree

  create_table "cities", force: true do |t|
    t.string   "alias",      limit: 32
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["alias"], name: "index_cities_on_alias", using: :btree

  create_table "operations", force: true do |t|
    t.string   "alias",      limit: 32
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operations", ["alias"], name: "index_operations_on_alias", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "nick_name"
    t.date     "birthdate_on"
    t.string   "sex",          limit: 8
    t.string   "phone"
    t.string   "photo"
    t.string   "photo_big"
    t.string   "city"
    t.string   "country"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "network"
    t.string   "uid"
    t.string   "profile"
  end

end
