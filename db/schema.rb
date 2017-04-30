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

ActiveRecord::Schema.define(version: 20170430163550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id", null: false
    t.integer  "away_team_id", null: false
    t.date     "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "tourney_id"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
    t.index ["home_team_id", "away_team_id"], name: "index_matches_on_home_team_id_and_away_team_id", using: :btree
    t.index ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree
    t.index ["tourney_id"], name: "index_matches_on_tourney_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "full_name"
    t.string   "position"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.date     "birth_date"
    t.string   "ocupation"
    t.string   "phote"
    t.string   "leg"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.string   "trainer"
    t.date     "foundation_date"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "teams_tourneys", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "tourney_id"
    t.index ["team_id"], name: "index_teams_tourneys_on_team_id", using: :btree
    t.index ["tourney_id"], name: "index_teams_tourneys_on_tourney_id", using: :btree
  end

  create_table "tourneys", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "format"
    t.string   "location"
    t.date     "inscription_limit_date"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.time     "schedule"
    t.text     "prize"
    t.string   "price"
    t.string   "mail"
    t.string   "phone"
    t.index ["user_id"], name: "index_tourneys_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email",      null: false
    t.string   "username",   null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "players", "teams"
end
