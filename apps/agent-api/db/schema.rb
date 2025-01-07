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

ActiveRecord::Schema[8.0].define(version: 2024_11_27_171700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "assetable_type"
    t.bigint "assetable_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "index_assets_on_assetable"
    t.index ["user_id"], name: "index_assets_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.bigint "rarity_id", null: false
    t.float "efficiency"
    t.float "purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assetable_id"
    t.string "assetable_type"
    t.index ["rarity_id"], name: "index_badges_on_rarity_id"
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "game_name", null: false
    t.boolean "on_chain", default: false
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "currency_packs", force: :cascade do |t|
    t.string "currency_id"
    t.integer "currency_number"
    t.float "price"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "build", null: false
    t.datetime "date", null: false
    t.string "map", null: false
    t.integer "total_fee"
    t.float "fee_cost"
    t.string "slots"
    t.float "luckrate"
    t.integer "time"
    t.integer "energy_used"
    t.float "energy_cost"
    t.integer "total_token"
    t.float "token_value"
    t.integer "total_premium_currency"
    t.float "premium_currency_value"
    t.float "profit"
    t.float "bonus_multiplier"
    t.float "perks_multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "player_cycles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cycle_name"
    t.string "player_cycle_type"
    t.integer "nb_badge"
    t.string "minimum_badge_rarity"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "nb_date_repeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_player_cycles_on_user_id"
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "max_supply", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "showrunner_contracts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.bigint "rarity_id", null: false
    t.float "purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assetable_id"
    t.string "assetable_type"
    t.index ["rarity_id"], name: "index_showrunner_contracts_on_rarity_id"
    t.index ["user_id"], name: "index_showrunner_contracts_on_user_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "game"
    t.integer "unlock_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_builds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "build_name", null: false
    t.float "bonus_multiplier"
    t.float "perks_multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_builds_on_user_id"
  end

  create_table "user_recharges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "discount_time"
    t.integer "discount_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_recharges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "openloot_id", null: false
    t.boolean "is_premium"
    t.integer "level"
    t.integer "experience"
    t.string "asset_type"
    t.string "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "assets", "users"
  add_foreign_key "badges", "rarities"
  add_foreign_key "badges", "users"
  add_foreign_key "currencies", "games", column: "game_name", primary_key: "name"
  add_foreign_key "matches", "users"
  add_foreign_key "player_cycles", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "showrunner_contracts", "rarities"
  add_foreign_key "showrunner_contracts", "users"
  add_foreign_key "user_builds", "users"
  add_foreign_key "user_recharges", "users"
end
