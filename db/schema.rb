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

ActiveRecord::Schema.define(version: 20140410171823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "betausers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "betausers", ["email"], name: "index_betausers_on_email", unique: true, using: :btree
  add_index "betausers", ["reset_password_token"], name: "index_betausers_on_reset_password_token", unique: true, using: :btree

  create_table "blog_comments", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_comments", ["post_id"], name: "index_blog_comments_on_post_id", using: :btree

  create_table "blog_posts", force: true do |t|
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.integer  "comments_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_posts", ["blogger_type", "blogger_id"], name: "index_blog_posts_on_blogger_type_and_blogger_id", using: :btree

  create_table "facebook_accounts", force: true do |t|
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "uid"
    t.string   "user"
    t.string   "provider"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "task_lists", force: true do |t|
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "task_lists", ["owner_id"], name: "index_task_lists_on_owner_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "description",                 null: false
    t.integer  "priority"
    t.date     "due_date"
    t.boolean  "completed",   default: false, null: false
    t.integer  "list_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonies", force: true do |t|
    t.string   "tweet_id"
    t.string   "screen_name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_accounts", force: true do |t|
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  create_table "twitter_data", force: true do |t|
    t.string   "tweet"
    t.string   "favorites"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_secret"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "facebook_uid"
    t.string   "facebook_name"
    t.string   "facebook_oauth_token"
    t.datetime "facebook_oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
