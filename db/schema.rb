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

ActiveRecord::Schema.define(version: 2018_07_30_092846) do

  create_table  "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "name",         null: false
    t.string    "record_type",  null: false
    t.bigint    "record_id",    null: false
    t.bigint    "blob_id",      null: false
    t.datetime  "created_at",   null: false

    t.index ["blob_id"],                                      name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"],  name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table  "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "key",          null: false
    t.string    "filename",     null: false
    t.string    "content_type"
    t.text      "metadata"
    t.bigint    "byte_size",    null: false
    t.string    "checksum",     null: false
    t.datetime  "created_at",   null: false

    t.index ["key"],          name: "index_active_storage_blobs_on_key", unique: true
  endx

  create_table  "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "name",         limit: 10
    t.string    "website"
    t.datetime  "created_at",   null: false
    t.datetime  "updated_at",   null: false
  end

  create_table  "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "name",         limit: 30
    t.datetime  "created_at",   null: false
    t.datetime  "updated_at",   null: false
  end

  create_table  "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "name"
    t.string    "address",      limit: 1000
    t.string    "number",       limit: 13
    t.string    "username",     limit: 10
    t.string    "email"
    t.datetime  "created_at",   null: false
    t.datetime  "updated_at",   null: false
  end

  create_table  "laptop_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint    "laptop_id"
    t.bigint    "category_id"
    t.datetime  "created_at",   null: false
    t.datetime  "updated_at",   null: false

    t.index ["category_id"],  name: "index_laptop_categories_on_category_id"
    t.index ["laptop_id"],    name: "index_laptop_categories_on_laptop_id"
  end

  create_table  "laptops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "model_number",   limit: 10
    t.string    "name",           limit: 50
    t.string    "serial_number",  limit: 20
    t.string    "ram",            limit: 7
    t.string    "hdd",            limit: 7
    t.string    "processor",      limit: 50
    t.string    "weight",         limit: 10
    t.string    "screen",         limit: 10
    t.string    "graphics_card",  limit: 20
    t.bigint    "usb_port"
    t.bigint    "hdmi_port"
    t.boolean   "available"
    t.bigint    "brand_id"
    t.datetime  "created_at",     null: false
    t.datetime  "updated_at",     null: false

    t.index ["brand_id"],     name: "index_laptops_on_brand_id"
  end

  create_table  "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date      "date"
    t.string    "shipping_address", limit: 1000
    t.string    "billing_address",  limit: 1000
    t.string    "status",           limit: 5
    t.integer   "amount"
    t.bigint    "laptop_id"
    t.bigint    "customer_id"
    t.datetime  "created_at",       null: false
    t.datetime  "updated_at",       null: false

    t.index ["customer_id"],  name: "index_orders_on_customer_id"
    t.index ["laptop_id"],    name: "index_orders_on_laptop_id"
  end

  create_table  "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "mode",             limit: 5
    t.string    "status",           limit: 5
    t.integer   "amount"
    t.bigint    "order_id"
    t.datetime  "created_at",       null: false
    t.datetime  "updated_at",       null: false

    t.index ["order_id"],     name: "index_payments_on_order_id"
  end

  create_table  "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string    "email",                default: "", null: false
    t.string    "encrypted_password",   default: "", null: false
    t.string    "reset_password_token"
    t.datetime  "reset_password_sent_at"
    t.datetime  "remember_created_at"
    t.integer   "sign_in_count",        default: 0, null: false
    t.datetime  "current_sign_in_at"
    t.datetime  "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.datetime  "created_at",           null: false
    t.datetime  "updated_at",           null: false
    
    t.index ["email"],                name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "laptop_categories", "categories"
  add_foreign_key "laptop_categories", "laptops"
  add_foreign_key "laptops", "brands"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "laptops"
  add_foreign_key "payments", "orders"
end
