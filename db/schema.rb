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

ActiveRecord::Schema.define(:version => 20130329185236) do

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "pub_date"
    t.text     "description"
    t.string   "format"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "num_words"
    t.boolean  "sandbox"
  end

  add_index "documents", ["title"], :name => "index_documents_on_title"

  create_table "facets", :force => true do |t|
    t.string   "color"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "prism_id"
  end

  create_table "markings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.text     "word_array"
    t.integer  "facet_id"
    t.integer  "prism_id"
  end

  create_table "prisms", :force => true do |t|
    t.text     "prompt"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "document_id"
    t.string   "title"
    t.string   "author"
    t.text     "content"
    t.boolean  "sandbox"
    t.integer  "num_words"
    t.string   "facet1"
    t.string   "facet2"
    t.string   "facet3"
    t.string   "facet4"
    t.string   "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "authentication_token"
    t.string   "password_confirmation"
    t.string   "provider"
    t.string   "uid"
    t.integer  "facet_num"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "word_markings", :force => true do |t|
    t.integer  "index"
    t.integer  "facet1_count"
    t.integer  "facet2_count"
    t.integer  "facet3_count"
    t.integer  "facet4_count"
    t.integer  "prism_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "word_markings", ["prism_id"], :name => "index_word_markings_on_prism_id"

end
