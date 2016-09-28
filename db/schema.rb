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

ActiveRecord::Schema.define(version: 20160913222328) do

  create_table "player_sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "player_set_id"
    t.string   "name"
    t.string   "position"
    t.string   "age"
    t.string   "team"
    t.integer  "fppg"
    t.string   "started"
    t.string   "gamesPlayed"
    t.string   "salary"
    t.string   "game"
    t.string   "opponent"
    t.string   "injury"
    t.string   "injuryDetails"
    t.string   "completions"
    t.string   "passingAttempts"
    t.string   "completionPercent"
    t.string   "passYards"
    t.string   "passTouchdowns"
    t.string   "passPerGame"
    t.integer  "comPerGame"
    t.integer  "attemptsPerGame"
    t.string   "targets"
    t.integer  "targetsPerGame"
    t.string   "receptions"
    t.string   "catchPercentage"
    t.string   "catchYards"
    t.string   "yardsPerCatch"
    t.string   "receiveTouchdowns"
    t.string   "longReceive"
    t.string   "catchPerGame"
    t.string   "receiveYardsPerGame"
    t.string   "receiveFumbles"
    t.string   "touches"
    t.string   "rushYards"
    t.string   "rushTouchdowns"
    t.string   "longRush"
    t.string   "yardsPerCarry"
    t.string   "rushPerGame"
    t.string   "touchPerGame"
    t.string   "rushFumbles"
    t.integer  "touchdowns"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
