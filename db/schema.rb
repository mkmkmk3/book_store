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

ActiveRecord::Schema.define(version: 2019_08_04_062053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_authors_items", force: :cascade do |t|
    t.bigint "item_author_id", null: false
    t.bigint "item_id", null: false
    t.string "author_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_author_id", "item_id"], name: "index_item_authors_items_on_item_author_id_and_item_id"
    t.index ["item_author_id"], name: "index_item_authors_items_on_item_author_id"
    t.index ["item_id"], name: "index_item_authors_items_on_item_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_images", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "file", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "item_isbn_codes", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "isbn13", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn13"], name: "index_item_isbn_codes_on_isbn13", unique: true
    t.index ["item_id"], name: "index_item_isbn_codes_on_item_id"
  end

  create_table "item_sellers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_item_sellers_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.bigint "item_category_id", null: false
    t.bigint "item_seller_id", null: false
    t.date "published_on"
    t.date "discontinued_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discontinued_on"], name: "index_items_on_discontinued_on"
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
    t.index ["item_seller_id"], name: "index_items_on_item_seller_id"
    t.index ["published_on"], name: "index_items_on_published_on"
  end

  add_foreign_key "item_authors_items", "item_authors"
  add_foreign_key "item_authors_items", "items"
  add_foreign_key "item_images", "items"
  add_foreign_key "item_isbn_codes", "items"
  add_foreign_key "items", "item_categories"
  add_foreign_key "items", "item_sellers"
end
