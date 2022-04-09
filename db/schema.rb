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

ActiveRecord::Schema.define(version: 2022_04_07_010356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "category_associations", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "licence_category_id", null: false
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_category_associations_on_driver_id"
    t.index ["licence_category_id"], name: "index_category_associations_on_licence_category_id"
  end

  create_table "declarations", force: :cascade do |t|
    t.boolean "flag_police_report"
    t.boolean "flag_police_statement"
    t.string "police_station"
    t.boolean "flag_usual_driver"
    t.boolean "flag_usual_resident"
    t.boolean "flag_single"
    t.boolean "flag_employee"
    t.string "driving_reason"
    t.string "usual_parking_place"
    t.string "expertise_garage"
    t.string "expertise_date"
    t.string "expertise_phone_contact"
    t.integer "trailing_vehicule_registration_number"
    t.string "other_damages_description"
    t.string "other_damages_thirdparty_name"
    t.string "other_damages_thirdparty_address"
    t.datetime "declaration_datetime"
    t.bigint "report_id", null: false
    t.bigint "insurance_policy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_policy_id"], name: "index_declarations_on_insurance_policy_id"
    t.index ["report_id"], name: "index_declarations_on_report_id"
  end

  create_table "driver_reports", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_driver_reports_on_driver_id"
    t.index ["report_id"], name: "index_driver_reports_on_report_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "driver_licence_number"
    t.date "driver_licence_end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "insurance_certificates", force: :cascade do |t|
    t.bigint "insurance_policy_id"
    t.string "insurance_certification_number"
    t.string "international_certification_number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_policy_id"], name: "index_insurance_certificates_on_insurance_policy_id"
  end

  create_table "insurance_policies", force: :cascade do |t|
    t.string "insured_name"
    t.string "insured_last_name"
    t.string "address"
    t.string "insurance_company_name"
    t.string "policy_number"
    t.datetime "start_date"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "licence_categories", force: :cascade do |t|
    t.string "type"
    t.string "type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "report_statuses", force: :cascade do |t|
    t.string "status_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "accident_datetime"
    t.string "address"
    t.float "latitude"
    t.float "longtitude"
    t.boolean "flag_injury"
    t.boolean "flag_other_damage"
    t.string "visible_damages"
    t.string "observations"
    t.string "status_comment"
    t.integer "driver_1_id", null: false
    t.integer "driver_2_id"
    t.integer "vehicle_1_id", null: false
    t.integer "vehicle_2_id"
    t.bigint "report_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_status_id"], name: "index_reports_on_report_status_id"
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

  create_table "vehicle_associations", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_id"], name: "index_vehicle_associations_on_report_id"
    t.index ["vehicle_id"], name: "index_vehicle_associations_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "registration_number"
    t.string "chassis_number"
    t.bigint "insurance_certificate_id", null: false
    t.integer "gross_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insurance_certificate_id"], name: "index_vehicles_on_insurance_certificate_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "category_associations", "drivers"
  add_foreign_key "category_associations", "licence_categories"
  add_foreign_key "declarations", "insurance_policies"
  add_foreign_key "declarations", "reports"
  add_foreign_key "driver_reports", "drivers"
  add_foreign_key "driver_reports", "reports"
  add_foreign_key "drivers", "users"
  add_foreign_key "vehicle_associations", "reports"
  add_foreign_key "vehicle_associations", "vehicles"
  add_foreign_key "vehicles", "insurance_certificates"
end
