ActiveRecord::Schema.define(version: 20170622003229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "state_id"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_phone"
    t.index ["state_id"], name: "index_clients_on_state_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.bigint "user_id"
    t.index ["client_id"], name: "index_contacts_on_client_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_jobs", id: false, force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "job_id", null: false
    t.index ["contact_id", "job_id"], name: "index_contacts_jobs_on_contact_id_and_job_id"
    t.index ["job_id", "contact_id"], name: "index_contacts_jobs_on_job_id_and_contact_id"
  end

  create_table "fm_reps", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nickname"
    t.string "cell_number"
    t.string "work_number"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fm_reps_on_user_id"
  end

  create_table "fm_reps_jobs", id: false, force: :cascade do |t|
    t.bigint "fm_rep_id", null: false
    t.bigint "job_id", null: false
    t.index ["fm_rep_id", "job_id"], name: "index_fm_reps_jobs_on_fm_rep_id_and_job_id"
    t.index ["job_id", "fm_rep_id"], name: "index_fm_reps_jobs_on_job_id_and_fm_rep_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_jobs_on_client_id"
  end

  create_table "jobs_specialties", id: false, force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "specialty_id", null: false
    t.index ["job_id", "specialty_id"], name: "index_jobs_specialties_on_job_id_and_specialty_id"
    t.index ["specialty_id", "job_id"], name: "index_jobs_specialties_on_specialty_id_and_job_id"
  end

  create_table "jobs_states", id: false, force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "state_id", null: false
    t.index ["job_id", "state_id"], name: "index_jobs_states_on_job_id_and_state_id"
    t.index ["state_id", "job_id"], name: "index_jobs_states_on_state_id_and_job_id"
  end

  create_table "providers", force: :cascade do |t|
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_providers_on_user_id"
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

  create_table "roles", force: :cascade do |t|
    t.string "role_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "submissions", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "provider_id"
    t.string "app_status", default: "Submitted"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_status"], name: "index_submissions_on_app_status"
    t.index ["job_id", "provider_id"], name: "index_submissions_on_job_id_and_provider_id"
    t.index ["job_id"], name: "index_submissions_on_job_id"
    t.index ["provider_id", "job_id"], name: "index_submissions_on_provider_id_and_job_id"
    t.index ["provider_id"], name: "index_submissions_on_provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.bigint "role_id", default: 2
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "work_sites", force: :cascade do |t|
    t.bigint "client_id"
    t.string "address"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_work_sites_on_client_id"
    t.index ["state_id"], name: "index_work_sites_on_state_id"
  end

  add_foreign_key "clients", "states"
  add_foreign_key "contacts", "clients"
  add_foreign_key "contacts", "users"
  add_foreign_key "fm_reps", "users"
  add_foreign_key "jobs", "clients"
  add_foreign_key "providers", "users"
  add_foreign_key "submissions", "jobs"
  add_foreign_key "submissions", "providers"
  add_foreign_key "users", "roles"
  add_foreign_key "work_sites", "clients"
  add_foreign_key "work_sites", "states"
end
