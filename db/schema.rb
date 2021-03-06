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

ActiveRecord::Schema.define(version: 20140831020249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "streams", force: true do |t|
    t.string   "slug"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "opentok_id"
    t.boolean  "broadcasted", default: false
  end

  add_index "streams", ["slug"], name: "index_streams_on_slug", using: :btree

  create_table "subscriptions", force: true do |t|
    t.string   "email"
    t.string   "subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "subscriptions", ["slug"], name: "index_subscriptions_on_slug", using: :btree

end
