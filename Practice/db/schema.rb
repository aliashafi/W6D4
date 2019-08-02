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

ActiveRecord::Schema.define(version: 2019_08_01_222315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_shares", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "viewer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorite"
    t.index ["artist_id", "viewer_id"], name: "index_art_shares_on_artist_id_and_viewer_id", unique: true
    t.index ["artist_id"], name: "index_art_shares_on_artist_id"
    t.index ["favorite", "viewer_id"], name: "index_art_shares_on_favorite_and_viewer_id", unique: true
    t.index ["viewer_id"], name: "index_art_shares_on_viewer_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorite"
    t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "user_id", null: false
    t.integer "artwork_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_comments_on_artwork_id"
    t.index ["user_id", "artwork_id"], name: "index_comments_on_user_id_and_artwork_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end
