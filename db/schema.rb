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

ActiveRecord::Schema[7.0].define(version: 2023_03_26_074658) do
  create_table "boroughs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genera", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "common_name"
    t.integer "genus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genus_id"], name: "index_species_on_genus_id"
  end

  create_table "trees", force: :cascade do |t|
    t.integer "gla_id"
    t.integer "borough_id", null: false
    t.integer "species_id", null: false
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borough_id"], name: "index_trees_on_borough_id"
    t.index ["gla_id"], name: "index_trees_on_gla_id", unique: true
    t.index ["species_id"], name: "index_trees_on_species_id"
  end

  add_foreign_key "species", "genera"
  add_foreign_key "trees", "boroughs"
  add_foreign_key "trees", "species"
end
