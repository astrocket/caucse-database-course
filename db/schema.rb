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

ActiveRecord::Schema.define(version: 20170411052032) do

  create_table "assets", force: :cascade do |t|
    t.string   "number"
    t.date     "purchased_date"
    t.string   "name"
    t.string   "standard"
    t.string   "price"
    t.string   "seller"
    t.string   "year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "box_infos", force: :cascade do |t|
    t.string   "location"
    t.string   "index_start"
    t.string   "index_length"
    t.string   "ip"
    t.string   "name"
    t.string   "color"
    t.integer  "box_id"
    t.integer  "switch_id"
    t.integer  "server_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "box_infos", ["box_id"], name: "index_box_infos_on_box_id"
  add_index "box_infos", ["server_id"], name: "index_box_infos_on_server_id"
  add_index "box_infos", ["switch_id"], name: "index_box_infos_on_switch_id"

  create_table "boxes", force: :cascade do |t|
    t.string   "number"
    t.string   "location"
    t.string   "spec"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boxes", ["asset_id"], name: "index_boxes_on_asset_id"

  create_table "servers", force: :cascade do |t|
    t.string   "number"
    t.string   "location"
    t.string   "spec"
    t.integer  "core"
    t.string   "ip"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "servers", ["asset_id"], name: "index_servers_on_asset_id"

  create_table "service_nots", force: :cascade do |t|
    t.string   "name"
    t.integer  "core"
    t.integer  "san"
    t.integer  "nas"
    t.integer  "tape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_usings", force: :cascade do |t|
    t.string   "name"
    t.integer  "core"
    t.integer  "san"
    t.integer  "nas"
    t.integer  "tape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_allocations", force: :cascade do |t|
    t.integer  "allocation"
    t.string   "purpose"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "storage_allocations", ["service_id"], name: "index_storage_allocations_on_service_id"

  create_table "storage_infos", force: :cascade do |t|
    t.string   "name"
    t.date     "registration_date"
    t.string   "disk_capacity"
    t.string   "type"
    t.integer  "allocation_unit"
    t.integer  "allocation_volume"
    t.integer  "allocation_left"
    t.integer  "storage_id"
    t.integer  "storage_allocation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "storage_infos", ["storage_allocation_id"], name: "index_storage_infos_on_storage_allocation_id"
  add_index "storage_infos", ["storage_id"], name: "index_storage_infos_on_storage_id"

  create_table "storages", force: :cascade do |t|
    t.string   "number"
    t.string   "location"
    t.string   "spec"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "storages", ["asset_id"], name: "index_storages_on_asset_id"

  create_table "switches", force: :cascade do |t|
    t.string   "number"
    t.string   "location"
    t.string   "spec"
    t.string   "ip"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "switches", ["asset_id"], name: "index_switches_on_asset_id"

end
