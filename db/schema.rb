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

ActiveRecord::Schema.define(:version => 20120318102231) do

  create_table "contact_activities", :force => true do |t|
    t.date     "activity_date"
    t.text     "description"
    t.integer  "contact_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "contact_activities", ["contact_id"], :name => "index_contact_activities_on_contact_id"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "contacts", ["user_id", "created_at"], :name => "index_contacts_on_user_id_and_created_at"

  create_table "leads", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "notes"
    t.date     "target_date"
    t.integer  "contact_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "leads", ["contact_id"], :name => "index_leads_on_contact_id"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "priority"
    t.date     "target_date"
    t.date     "actual_date"
    t.integer  "contact_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "task_type"
  end

  add_index "tasks", ["contact_id"], :name => "index_tasks_on_contact_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
