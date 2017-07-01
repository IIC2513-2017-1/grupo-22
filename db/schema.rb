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

ActiveRecord::Schema.define(version: 20170629093039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_comments_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "foros", force: :cascade do |t|
    t.integer  "tourney_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["tourney_id"], name: "index_foros_on_tourney_id", unique: true, using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id",                 null: false
    t.integer  "away_team_id",                 null: false
    t.date     "date"
    t.boolean  "played",       default: false
    t.integer  "home_goals",   default: 0
    t.integer  "away_goals",   default: 0
    t.string   "winner"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "tourney_id"
    t.string   "bracket_code"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
    t.index ["home_team_id", "away_team_id"], name: "index_matches_on_home_team_id_and_away_team_id", using: :btree
    t.index ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree
    t.index ["tourney_id"], name: "index_matches_on_tourney_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "team_id",    null: false
    t.integer  "tourney_id", null: false
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_participants_on_team_id", using: :btree
    t.index ["tourney_id"], name: "index_participants_on_tourney_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "full_name"
    t.string   "position"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.date     "birth_date"
    t.string   "ocupation"
    t.string   "leg"
    t.integer  "team_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
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
    t.string   "trainer"
    t.date     "foundation_date"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "foro_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foro_id"], name: "index_topics_on_foro_id", using: :btree
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
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
    t.string   "city"
    t.index ["user_id"], name: "index_tourneys_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email",               null: false
    t.string   "username",            null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "players", "teams"
  add_foreign_key "topics", "foros"
  add_foreign_key "topics", "users"
  add_foreign_key "tourneys", "users"
end
