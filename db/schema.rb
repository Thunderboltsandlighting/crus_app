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

ActiveRecord::Schema[7.2].define(version: 2024_11_05_225046) do
  create_table "beers", force: :cascade do |t|
    t.string "recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brewing_salts", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.string "type"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uom"
    t.decimal "total_cost"
    t.index ["recipe_id"], name: "index_brewing_salts_on_recipe_id"
  end

  create_table "grains", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uom"
    t.decimal "total_cost"
    t.index ["recipe_id"], name: "index_grains_on_recipe_id"
  end

  create_table "hops", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.integer "time"
    t.decimal "ibu"
    t.string "hop_type"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uom"
    t.decimal "total_cost"
    t.index ["recipe_id"], name: "index_hops_on_recipe_id"
  end

  create_table "miscs", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.string "uom"
    t.decimal "total_cost"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_miscs_on_recipe_id"
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "sku"
    t.string "product_description"
    t.string "category"
    t.string "uom"
    t.integer "re_order_level"
    t.decimal "mpq", precision: 10, scale: 2
    t.decimal "cost_per_mpq", precision: 10, scale: 2
    t.decimal "cost_per_uom", precision: 10, scale: 2
    t.string "vendor"
    t.string "vendor_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "quantity", precision: 10, scale: 2
    t.date "received_date"
    t.date "deduction_date"
    t.string "purchase_order"
    t.string "reason"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "abv"
    t.decimal "ibu"
    t.decimal "srm"
    t.text "description"
    t.string "style"
  end

  create_table "yeasts", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uom"
    t.decimal "total_cost"
    t.index ["recipe_id"], name: "index_yeasts_on_recipe_id"
  end

  add_foreign_key "brewing_salts", "recipes"
  add_foreign_key "grains", "recipes"
  add_foreign_key "hops", "recipes"
  add_foreign_key "miscs", "recipes"
  add_foreign_key "yeasts", "recipes"
end
