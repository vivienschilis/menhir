# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090525170002) do

  create_table "automated_todo_closings", :force => true do |t|
    t.string   "type"
    t.text     "job"
    t.integer  "interval"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogcoms", :force => true do |t|
    t.string   "poster"
    t.string   "website"
    t.integer  "blogpost_id"
    t.text     "content"
    t.integer  "public_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogposts", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.integer  "project_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborators", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "address_1",    :default => "", :null => false
    t.string   "address_2",    :default => "", :null => false
    t.string   "state",        :default => "", :null => false
    t.string   "zipcode",      :default => "", :null => false
    t.string   "phone_office", :default => "", :null => false
    t.string   "phone_fax",    :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_versions", :force => true do |t|
    t.integer  "document_id"
    t.integer  "version_id"
    t.string   "version_file_name"
    t.string   "version_content_type"
    t.integer  "version_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "git_repositories", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "project_id"
    t.integer  "file"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",      :default => false
    t.integer  "creator_id",     :default => 0
    t.integer  "responsible_id", :default => 0
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "image_id"
    t.integer  "is_published"
    t.integer  "license_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_id"
    t.integer  "user_id",      :default => 0
  end

  create_table "shackmates", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todo_lists", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", :force => true do |t|
    t.integer  "todo_list_id"
    t.integer  "progression"
    t.integer  "milestone_id"
    t.string   "task"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",      :default => false
    t.integer  "creator_id",     :default => 0
    t.integer  "responsible_id", :default => 0
  end

  create_table "user_projects", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "full_name"
    t.string   "trigram"
    t.string   "phone"
    t.string   "description"
    t.string   "portfolio_title"
    t.integer  "image_id"
    t.string   "resume"
    t.integer  "is_admin"
    t.datetime "created_at"
    t.string   "address_town"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "address_country"
    t.datetime "updated_at"
    t.integer  "avatar_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.integer  "company_id"
  end

end
