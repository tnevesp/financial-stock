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

ActiveRecord::Schema.define(version: 20190114225045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "carteiras", force: :cascade do |t|
    t.date     "data_da_compra"
    t.integer  "empresa_id"
    t.integer  "user_id"
    t.decimal  "entrada",             precision: 11, scale: 5
    t.decimal  "alvo",                precision: 11, scale: 2
    t.decimal  "stop",                precision: 11, scale: 2
    t.decimal  "atual",               precision: 11, scale: 5
    t.integer  "quantidade"
    t.string   "situacao"
    t.decimal  "total_da_compra",     precision: 11, scale: 5
    t.decimal  "total_da_venda",      precision: 11, scale: 5
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.date     "data_da_venda"
    t.integer  "corretora_id"
    t.integer  "tipo_de_operacao_id"
    t.text     "observacao"
    t.index ["corretora_id"], name: "index_carteiras_on_corretora_id", using: :btree
    t.index ["empresa_id"], name: "index_carteiras_on_empresa_id", using: :btree
    t.index ["tipo_de_operacao_id"], name: "index_carteiras_on_tipo_de_operacao_id", using: :btree
    t.index ["user_id"], name: "index_carteiras_on_user_id", using: :btree
  end

  create_table "corretoras", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "simbolo"
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_de_operacoes", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.jsonb    "filtro_da_carteira",     default: "{}", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["filtro_da_carteira"], name: "index_users_on_filtro_da_carteira", using: :gin
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.integer  "paper_id"
    t.integer  "user_id"
    t.decimal  "purchased_price", precision: 8, scale: 2
    t.integer  "quantity"
    t.date     "purchased_at"
    t.date     "sold_at"
    t.decimal  "sold_price",      precision: 8, scale: 2
    t.string   "status"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["paper_id"], name: "index_wallets_on_paper_id", using: :btree
    t.index ["user_id"], name: "index_wallets_on_user_id", using: :btree
  end

  add_foreign_key "carteiras", "corretoras"
  add_foreign_key "carteiras", "empresas"
  add_foreign_key "carteiras", "tipo_de_operacoes"
  add_foreign_key "carteiras", "users"
  add_foreign_key "wallets", "papers"
  add_foreign_key "wallets", "users"
end
