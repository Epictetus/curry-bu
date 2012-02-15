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

ActiveRecord::Schema.define(:version => 20120215015300) do

  create_table "activities", :force => true do |t|
    t.string   "name",                      :null => false
    t.text     "comment"
    t.date     "ate_at",                    :null => false
    t.integer  "shop_id",                   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id",    :default => 0, :null => false
  end

  add_index "activities", ["shop_id"], :name => "index_activities_on_shop_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "title",                     :null => false
    t.text     "comment"
    t.string   "image",                     :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id",    :default => 0, :null => false
    t.integer  "shop_id",    :default => 0, :null => false
    t.date     "ate_at"
  end

  add_index "images", ["ate_at"], :name => "index_images_on_ate_at"
  add_index "images", ["shop_id"], :name => "index_images_on_shop_id"
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "shops", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
