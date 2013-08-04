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

ActiveRecord::Schema.define(:version => 20130804223425) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "thought_id"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["thought_id", "created_at"], :name => "index_comments_on_thought_id_and_created_at"

  create_table "ownerships", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ownerships", ["project_id", "user_id"], :name => "index_ownerships_on_project_id_and_user_id", :unique => true
  add_index "ownerships", ["project_id"], :name => "index_ownerships_on_project_id"
  add_index "ownerships", ["user_id"], :name => "index_ownerships_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brief"
  end

  add_index "projects", ["user_id", "created_at"], :name => "index_projects_on_user_id_and_created_at"

  create_table "stories", :force => true do |t|
    t.string   "content"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "points"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["project_id", "created_at", "user_id"], :name => "index_stories_on_project_id_and_created_at_and_user_id"

  create_table "thoughts", :force => true do |t|
    t.string   "content"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scratchfile_file_name"
    t.string   "scratchfile_content_type"
    t.integer  "scratchfile_file_size"
    t.datetime "scratchfile_updated_at"
  end

  add_index "thoughts", ["project_id", "created_at"], :name => "index_thoughts_on_project_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
