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

ActiveRecord::Schema.define(version: 20170614064704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "states_id"
    t.index ["states_id"], name: "index_providers_on_states_id"
  end

  create_table "providers_specialties", id: false, force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "specialty_id", null: false
    t.index ["provider_id", "specialty_id"], name: "index_providers_specialties_on_provider_id_and_specialty_id"
    t.index ["specialty_id", "provider_id"], name: "index_providers_specialties_on_specialty_id_and_provider_id"
  end

  create_table "providers_states", id: false, force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "state_id", null: false
    t.index ["provider_id", "state_id"], name: "index_providers_states_on_provider_id_and_state_id"
    t.index ["state_id", "provider_id"], name: "index_providers_states_on_state_id_and_provider_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "provider_type"
    t.string "specialty"
    t.string "sub_specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "providers", "states", column: "states_id"
end
