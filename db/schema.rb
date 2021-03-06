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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120704012907) do

  create_table "item_comments", :force => true do |t|
    t.integer  "item_id",    :null => false
    t.integer  "user_id",    :null => false
    t.text     "comment",    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_comments", ["item_id"], :name => "item_comments_item_id_fk"
  add_index "item_comments", ["user_id"], :name => "item_comments_user_id_fk"

  create_table "items", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "comment"
    t.string   "image",      :null => false
    t.date     "ate_at",     :null => false
    t.integer  "user_id",    :null => false
    t.integer  "shop_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "price"
    t.datetime "deleted_at"
  end

  add_index "items", ["ate_at"], :name => "index_items_on_ate_at"
  add_index "items", ["deleted_at"], :name => "index_items_on_deleted_at"
  add_index "items", ["shop_id"], :name => "index_items_on_shop_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "likeable_id",                 :null => false
    t.string   "likeable_type", :limit => 20, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "likes", ["likeable_id", "likeable_type", "user_id"], :name => "index_likes_on_likeable_id_and_likeable_type_and_user_id", :unique => true
  add_index "likes", ["user_id"], :name => "likes_user_id_fk"

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "shops", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "create_user_id", :null => false
    t.integer  "update_user_id", :null => false
    t.datetime "deleted_at"
    t.string   "address"
  end

  add_index "shops", ["create_user_id"], :name => "shops_create_user_id_fk"
  add_index "shops", ["deleted_at"], :name => "index_shops_on_deleted_at"
  add_index "shops", ["name", "deleted_at"], :name => "index_shops_on_name_and_deleted_at", :unique => true
  add_index "shops", ["update_user_id"], :name => "shops_update_user_id_fk"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "mail",                                :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.string   "login_name",                          :null => false
    t.string   "image"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], :name => "index_users_on_deleted_at"
  add_index "users", ["login_name", "deleted_at"], :name => "index_users_on_login_name_and_deleted_at", :unique => true
  add_index "users", ["mail", "deleted_at"], :name => "index_users_on_mail_and_deleted_at", :unique => true

  add_foreign_key "item_comments", "items", :name => "item_comments_item_id_fk"
  add_foreign_key "item_comments", "users", :name => "item_comments_user_id_fk"

  add_foreign_key "items", "shops", :name => "items_shop_id_fk"
  add_foreign_key "items", "users", :name => "items_user_id_fk"

  add_foreign_key "likes", "users", :name => "likes_user_id_fk"

  add_foreign_key "shops", "users", :name => "shops_create_user_id_fk", :column => "create_user_id"
  add_foreign_key "shops", "users", :name => "shops_update_user_id_fk", :column => "update_user_id"

end
