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

ActiveRecord::Schema.define(version: 2022_03_19_102354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "category_associations", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "licence_category_id", null: false
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_category_associations_on_driver_id"
    t.index ["licence_category_id"], name: "index_category_associations_on_licence_category_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "driver_licence_number"
    t.date "driver_licence_end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "licence_categories", force: :cascade do |t|
    t.string "type"
    t.string "type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "family_name"
    t.string "address"
    t.string "identity_number"
    t.string "type_of_id_document"
    t.date "birthdate"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category_associations", "drivers"
  add_foreign_key "category_associations", "licence_categories"
  add_foreign_key "drivers", "users"
end
