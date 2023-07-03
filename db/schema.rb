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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_053350) do
  create_table "accessories", charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "manufacture_id", null: false
    t.string "name", null: false
    t.decimal "price", precision: 10, null: false
    t.integer "quantity", null: false
    t.string "thumbnail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sell_number"
    t.integer "discount"
    t.string "feature"
    t.index ["name"], name: "index_accessories_on_name"
  end

  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carts", charset: "utf8mb3", force: :cascade do |t|
    t.integer "total_price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
    t.string "category_type", null: false
  end

  create_table "categories_manufactures", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "manufacture_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_manufactures_on_category_id"
    t.index ["manufacture_id"], name: "index_categories_manufactures_on_manufacture_id"
  end

  create_table "configuration_accessories", charset: "utf8mb3", force: :cascade do |t|
    t.integer "accessory_id"
    t.string "connect_type"
    t.text "feature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configurations", charset: "utf8mb3", force: :cascade do |t|
    t.integer "product_id", null: false
    t.text "screens"
    t.string "backside_camera"
    t.string "front_camera"
    t.string "memory_in"
    t.string "cpu"
    t.string "gpu"
    t.string "battery_capacity"
    t.string "sim"
    t.string "operating_system"
    t.string "made_by"
    t.date "released_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ram"
  end

  create_table "coupons", charset: "utf8mb3", force: :cascade do |t|
    t.string "code"
    t.integer "discount"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons_coupons_storeds", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "coupon_id"
    t.bigint "coupons_stored_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupons_coupons_storeds_on_coupon_id"
    t.index ["coupons_stored_id"], name: "index_coupons_coupons_storeds_on_coupons_stored_id"
  end

  create_table "coupons_stored_coupons", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "coupon_id"
    t.bigint "coupons_stored_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupons_stored_coupons_on_coupon_id"
    t.index ["coupons_stored_id"], name: "index_coupons_stored_coupons_on_coupons_stored_id"
  end

  create_table "coupons_storeds", charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons_users", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupons_users_on_coupon_id"
    t.index ["user_id"], name: "index_coupons_users_on_user_id"
  end

  create_table "manufactures", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_manufactures_on_name", unique: true
  end

  create_table "order_detail_items", charset: "utf8mb3", force: :cascade do |t|
    t.integer "itemable_id", null: false
    t.string "itemable_type", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "orderable_id"
    t.string "orderable_type"
  end

  create_table "order_details", charset: "utf8mb3", force: :cascade do |t|
    t.integer "total_price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_id"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "order_detail_id", null: false
    t.integer "shipping_address_id", null: false
    t.string "order_key", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.integer "manufacture_id", null: false
    t.integer "category_id", null: false
    t.string "name", null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, null: false
    t.string "thumbnail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sell_number"
    t.integer "discount"
    t.string "feature"
    t.index ["name"], name: "index_products_on_name"
  end

  create_table "shipping_addresses", charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "receiver_name"
    t.integer "receiver_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "phone_number", null: false
    t.integer "area_code", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "password_comfirmation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
