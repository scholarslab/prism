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

ActiveRecord::Schema.define(:version => 20111031182021) do

  create_table "img_docs", :force => true do |t|
    t.binary   "img"
    t.string   "format"
    t.integer  "text_id"
    t.integer  "span_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "img_docs", ["span_id"], :name => "index_img_docs_on_span_id"
  add_index "img_docs", ["text_id"], :name => "index_img_docs_on_text_id"

  create_table "img_spans", :force => true do |t|
    t.string   "vector"
    t.string   "session"
    t.integer  "tag_id"
    t.integer  "doc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "img_spans", ["doc_id"], :name => "index_img_spans_on_doc_id"
  add_index "img_spans", ["tag_id"], :name => "index_img_spans_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "color"
    t.string   "name"
    t.integer  "text_id"
    t.integer  "img_spans_id"
    t.integer  "text_spans_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["img_spans_id"], :name => "index_tags_on_img_spans_id"
  add_index "tags", ["text_id"], :name => "index_tags_on_text_id"
  add_index "tags", ["text_spans_id"], :name => "index_tags_on_text_spans_id"

  create_table "text_docs", :force => true do |t|
    t.string   "markup"
    t.string   "format"
    t.integer  "text_id"
    t.integer  "span_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_docs", ["span_id"], :name => "index_text_docs_on_span_id"
  add_index "text_docs", ["text_id"], :name => "index_text_docs_on_text_id"

  create_table "text_spans", :force => true do |t|
    t.integer  "start"
    t.integer  "length"
    t.string   "session"
    t.integer  "tag_id"
    t.integer  "doc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_spans", ["doc_id"], :name => "index_text_spans_on_doc_id"
  add_index "text_spans", ["tag_id"], :name => "index_text_spans_on_tag_id"

  create_table "texts", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.date     "pub_date"
    t.integer  "tags_id"
    t.integer  "text_doc_id"
    t.integer  "img_doc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "texts", ["img_doc_id"], :name => "index_texts_on_img_doc_id"
  add_index "texts", ["tags_id"], :name => "index_texts_on_tags_id"
  add_index "texts", ["text_doc_id"], :name => "index_texts_on_text_doc_id"

end
