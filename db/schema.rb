# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_160726) do

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "state"], name: "index_cities_on_name_and_state", unique: true
    t.index ["state"], name: "index_cities_on_state"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "company_cities", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_company_cities_on_city_id"
    t.index ["company_id", "city_id"], name: "index_company_cities_on_company_id_and_city_id", unique: true
    t.index ["company_id"], name: "index_company_cities_on_company_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["name"], name: "index_people_on_name", unique: true
  end

  create_table "person_cities", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_person_cities_on_city_id"
    t.index ["person_id", "city_id"], name: "index_person_cities_on_person_id_and_city_id", unique: true
    t.index ["person_id"], name: "index_person_cities_on_person_id"
  end

  create_table "person_companies", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_person_companies_on_company_id"
    t.index ["person_id", "company_id"], name: "index_person_companies_on_person_id_and_company_id", unique: true
    t.index ["person_id"], name: "index_person_companies_on_person_id"
  end

  add_foreign_key "company_cities", "cities"
  add_foreign_key "company_cities", "companies"
  add_foreign_key "person_cities", "cities"
  add_foreign_key "person_cities", "people"
  add_foreign_key "person_companies", "companies"
  add_foreign_key "person_companies", "people"
end
