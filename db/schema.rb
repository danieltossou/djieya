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

ActiveRecord::Schema.define(version: 2019_08_25_165308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "annees", force: :cascade do |t|
    t.string "libelle"
    t.boolean "etat"
    t.bigint "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_annees_on_admin_id"
  end

  create_table "caisses", force: :cascade do |t|
    t.bigint "montant"
    t.string "libelle"
    t.string "operation"
    t.bigint "user_id", null: false
    t.bigint "ecole_id", null: false
    t.bigint "annee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annee_id"], name: "index_caisses_on_annee_id"
    t.index ["ecole_id"], name: "index_caisses_on_ecole_id"
    t.index ["user_id"], name: "index_caisses_on_user_id"
  end

  create_table "classe_rooms", force: :cascade do |t|
    t.string "libelle"
    t.boolean "etat"
    t.bigint "user_id", null: false
    t.bigint "montant"
    t.bigint "ecole_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ecole_id"], name: "index_classe_rooms_on_ecole_id"
    t.index ["user_id"], name: "index_classe_rooms_on_user_id"
  end

  create_table "dossiers", force: :cascade do |t|
    t.string "libelle"
    t.bigint "ecole_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ecole_id"], name: "index_dossiers_on_ecole_id"
    t.index ["user_id"], name: "index_dossiers_on_user_id"
  end

  create_table "dossiers_etudiants", id: false, force: :cascade do |t|
    t.bigint "dossier_id"
    t.bigint "etudiant_id"
    t.index ["dossier_id"], name: "index_dossiers_etudiants_on_dossier_id"
    t.index ["etudiant_id"], name: "index_dossiers_etudiants_on_etudiant_id"
  end

  create_table "ecoles", force: :cascade do |t|
    t.string "libelle"
    t.boolean "etat"
    t.bigint "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_ecoles_on_admin_id"
  end

  create_table "etudiants", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "sexe"
    t.datetime "date_naissance"
    t.string "matricule"
    t.string "num_inscription"
    t.bigint "classe_room_id", null: false
    t.boolean "oriente"
    t.string "nationnalite"
    t.string "email"
    t.text "adresse"
    t.bigint "contact"
    t.string "maladie"
    t.string "nom_parent"
    t.bigint "contact_parent"
    t.string "lien_parente"
    t.string "email_parent"
    t.string "photo"
    t.string "autre"
    t.bigint "ecole_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classe_room_id"], name: "index_etudiants_on_classe_room_id"
    t.index ["ecole_id"], name: "index_etudiants_on_ecole_id"
    t.index ["user_id"], name: "index_etudiants_on_user_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "etudiant_id", null: false
    t.bigint "user_id", null: false
    t.bigint "annee_id", null: false
    t.bigint "classe_room_id", null: false
    t.bigint "ecole_id", null: false
    t.bigint "montant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annee_id"], name: "index_inscriptions_on_annee_id"
    t.index ["classe_room_id"], name: "index_inscriptions_on_classe_room_id"
    t.index ["ecole_id"], name: "index_inscriptions_on_ecole_id"
    t.index ["etudiant_id"], name: "index_inscriptions_on_etudiant_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "nom"
    t.string "prenom"
    t.text "adresse"
    t.bigint "contact"
    t.string "sexe"
    t.string "matricule"
    t.bigint "ecole_id"
    t.boolean "etat"
    t.boolean "presence"
    t.string "categorie"
    t.datetime "date_derniere_connexion"
    t.datetime "date_derniere_deconnexion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.bigint "crea_user"
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["ecole_id"], name: "index_users_on_ecole_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versements", force: :cascade do |t|
    t.bigint "montant"
    t.bigint "user_id", null: false
    t.bigint "ecole_id", null: false
    t.bigint "annee_id", null: false
    t.bigint "etudiant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annee_id"], name: "index_versements_on_annee_id"
    t.index ["ecole_id"], name: "index_versements_on_ecole_id"
    t.index ["etudiant_id"], name: "index_versements_on_etudiant_id"
    t.index ["user_id"], name: "index_versements_on_user_id"
  end

  add_foreign_key "annees", "admins"
  add_foreign_key "caisses", "annees"
  add_foreign_key "caisses", "ecoles"
  add_foreign_key "caisses", "users"
  add_foreign_key "classe_rooms", "ecoles"
  add_foreign_key "classe_rooms", "users"
  add_foreign_key "dossiers", "ecoles"
  add_foreign_key "dossiers", "users"
  add_foreign_key "ecoles", "admins"
  add_foreign_key "etudiants", "classe_rooms"
  add_foreign_key "etudiants", "ecoles"
  add_foreign_key "etudiants", "users"
  add_foreign_key "inscriptions", "annees"
  add_foreign_key "inscriptions", "classe_rooms"
  add_foreign_key "inscriptions", "ecoles"
  add_foreign_key "inscriptions", "etudiants"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "users", "admins"
  add_foreign_key "versements", "annees"
  add_foreign_key "versements", "ecoles"
  add_foreign_key "versements", "etudiants"
  add_foreign_key "versements", "users"
end
