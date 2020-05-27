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

ActiveRecord::Schema.define(version: 2020_05_27_064649) do

  create_table "cards", id: false, force: :cascade do |t|
    t.string "idf"
    t.string "durata"
    t.string "categoria"
    t.string "zona"
    t.integer "energia"
    t.text "esercizi"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tutorial"
    t.string "spiegazione"
    t.index ["user_id"], name: "index_cards_on_user_id"
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
    t.boolean "arachidi_e_derivati", default: false
    t.boolean "frutta_a_guscio", default: false
    t.boolean "latte_e_derivati", default: false
    t.boolean "molluschi", default: false
    t.boolean "pesce", default: false
    t.boolean "sesamo", default: false
    t.boolean "soia", default: false
    t.boolean "crostacei", default: false
    t.boolean "glutine", default: false
    t.boolean "lupini", default: false
    t.boolean "senape", default: false
    t.boolean "sedano", default: false
    t.boolean "anidride_solforosa_e_solfiti", default: false
    t.boolean "uova_e_derivati", default: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
