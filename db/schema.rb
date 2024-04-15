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

ActiveRecord::Schema.define(version: 2022_12_16_131726) do

  create_table "checks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "english_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["english_id"], name: "index_comments_on_english_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "english_tag_relations", force: :cascade do |t|
    t.integer "english_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["english_id"], name: "index_english_tag_relations_on_english_id"
    t.index ["tag_id"], name: "index_english_tag_relations_on_tag_id"
  end

  create_table "englishes", force: :cascade do |t|
    t.string "topic"
    t.text "body"
    t.string "image"
    t.string "youtube_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "like2s", force: :cascade do |t|
    t.integer "video_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_like2s_on_user_id"
    t.index ["video_id"], name: "index_like2s_on_video_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "english_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["english_id"], name: "index_likes_on_english_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_replies_on_user_id"
    t.index ["video_id"], name: "index_replies_on_video_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_check_relations", force: :cascade do |t|
    t.integer "video_id", null: false
    t.integer "check_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_id"], name: "index_video_check_relations_on_check_id"
    t.index ["video_id"], name: "index_video_check_relations_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.text "body"
    t.string "youtube_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  add_foreign_key "comments", "englishes"
  add_foreign_key "comments", "users"
  add_foreign_key "english_tag_relations", "englishes"
  add_foreign_key "english_tag_relations", "tags"
  add_foreign_key "like2s", "users"
  add_foreign_key "like2s", "videos"
  add_foreign_key "likes", "englishes"
  add_foreign_key "likes", "users"
  add_foreign_key "replies", "users"
  add_foreign_key "replies", "videos"
  add_foreign_key "video_check_relations", "checks"
  add_foreign_key "video_check_relations", "videos"
end
