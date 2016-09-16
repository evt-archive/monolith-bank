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

ActiveRecord::Schema.define(version: 20160916030417) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds_transfers", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.string   "memo"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "funds_transfers", ["from_id"], name: "index_funds_transfers_on_from_id"
  add_index "funds_transfers", ["to_id"], name: "index_funds_transfers_on_to_id"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
