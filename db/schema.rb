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

ActiveRecord::Schema[7.0].define(version: 2023_04_25_070856) do
  create_table "accessories", charset: "utf8mb3", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "manufacture_id", null: false
    t.string "name", null: false
    t.decimal "price", precision: 10, null: false
    t.integer "quantity", null: false
    t.string "thumbnail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_accessories_on_name"
  end

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
  end

  create_table "categories_manufactures", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "manufacture_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_manufactures_on_category_id"
    t.index ["manufacture_id"], name: "index_categories_manufactures_on_manufacture_id"
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

  create_table "manufactures", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_manufactures_on_name", unique: true
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

end
