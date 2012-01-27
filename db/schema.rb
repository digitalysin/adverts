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

ActiveRecord::Schema.define(:version => 20120126124815) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "advertisement_categories", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "advertisement_prices", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisement_types", :force => true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisements", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.string   "phone"
    t.integer  "advertisement_category_id"
    t.integer  "advertisement_price_id"
    t.integer  "advertisement_type_id"
    t.string   "title"
    t.string   "site"
    t.string   "content"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
    t.string   "image"
    t.integer  "times_readed"
    t.string   "slug"
  end

  create_table "banner_categories", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "banner_category_id"
    t.integer  "how_long"
    t.string   "site"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "enabled"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "website"
    t.string   "phone"
    t.text     "message"
    t.boolean  "message_status"
    t.datetime "message_send_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "link_prices", :force => true do |t|
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "links", :force => true do |t|
    t.string   "anchor"
    t.string   "website"
    t.integer  "link_price_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "mailers", :force => true do |t|
    t.text     "confirmation_email"
    t.text     "regular_email"
    t.text     "activation_email"
    t.string   "model_for"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "deactivation_email"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.string   "site"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "network_type"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.string   "meta_keyword"
    t.string   "meta_content"
    t.boolean  "enabled"
    t.string   "model_for"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_configurations", :force => true do |t|
    t.string   "site_name"
    t.string   "site_title"
    t.string   "meta_keyword"
    t.string   "meta_description"
    t.string   "site_footer"
    t.string   "header_image"
    t.string   "admin_email"
    t.string   "admin_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
