# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140408220930) do

  create_table "links", force: true do |t|
    t.string  "title"
    t.text    "link_url"
    t.text    "img_url"
    t.integer "user_id"
    t.integer "ranking_id"
  end

  create_table "rankings", force: true do |t|
    t.integer "score"
    t.integer "link_id"
  end

  create_table "rankings_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "ranking_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
  end

end
