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

ActiveRecord::Schema.define(version: 2020_02_26_123618) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "mail"
    t.bigint "numUser"
    t.string "mdp"
    t.index ["numUser"], name: "admins_users_fk"
  end

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "libelle"
    t.float "prix"
    t.integer "stock"
    t.bigint "categorie"
    t.string "type"
    t.index ["categorie"], name: "aricles_categories_fk"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "libelle"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "mail"
    t.integer "numero"
    t.string "rue"
    t.integer "codePostal"
    t.string "ville"
    t.bigint "numUser"
    t.string "password_digest"
    t.index ["numUser"], name: "clients_users_fk"
  end

  create_table "contients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "numArticle"
    t.bigint "numPanier"
    t.integer "quantite"
    t.index ["numPanier"], name: "contients_paniers_fk"
  end

  create_table "paniers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "numUser"
    t.index ["numUser"], name: "paniers_users_fk"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "mail"
    t.string "mdp"
  end

  add_foreign_key "admins", "users", column: "numUser", name: "admins_users_fk"
  add_foreign_key "articles", "categories", column: "categorie", name: "aricles_categories_fk"
  add_foreign_key "clients", "users", column: "numUser", name: "clients_users_fk"
  add_foreign_key "contients", "paniers", column: "numPanier", name: "contients_paniers_fk"
  add_foreign_key "paniers", "users", column: "numUser", name: "paniers_users_fk"
end
