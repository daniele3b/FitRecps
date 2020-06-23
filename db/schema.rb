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

ActiveRecord::Schema.define(version: 2020_06_23_215554) do

  create_table "cards", force: :cascade do |t|
    t.string "idf"
    t.string "durata"
    t.string "categoria"
    t.string "zona"
    t.integer "energia"
    t.text "esercizi"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tutorial"
    t.string "spiegazione"
    t.integer "interazioni"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.decimal "valore"
    t.string "recipe_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.string "video_tutorial"
    t.float "energia"
    t.float "carboidrati"
    t.float "proteine"
    t.float "fibre"
    t.float "sodio"
    t.float "grassi"
    t.text "ingredienti"
    t.string "foto"
    t.text "procedimento"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codice"
    t.string "arachidi_e_derivati", default: "0"
    t.string "frutta_a_guscio", default: "0"
    t.string "latte_e_derivati", default: "0"
    t.string "molluschi", default: "0"
    t.string "pesce", default: "0"
    t.string "sesamo", default: "0"
    t.string "soia", default: "0"
    t.string "crostacei", default: "0"
    t.string "glutine", default: "0"
    t.string "lupini", default: "0"
    t.string "senape", default: "0"
    t.string "sedano", default: "0"
    t.string "anidride_solforosa_e_solfiti", default: "0"
    t.string "uova_e_derivati", default: "0"
    t.integer "interazioni"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "valore"
    t.string "card_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_reviews_on_card_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provide"
    t.string "uid"
    t.string "nome"
    t.string "cognome"
    t.string "luogoNascita"
    t.string "dataNascita"
    t.string "sesso"
    t.integer "roles_mask"
    t.boolean "admin", default: false
    t.boolean "employee", default: false
    t.string "provider"
    t.string "cf"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
