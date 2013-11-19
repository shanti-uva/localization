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

ActiveRecord::Schema.define(:version => 20131108181658) do

  create_table "contexts", :force => true do |t|
    t.text     "key"
    t.integer  "message_id"
    t.integer  "document_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "document_types", :force => true do |t|
    t.string   "name"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "document_type_id"
    t.integer  "project_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "languages", :force => true do |t|
    t.string  "title",                   :limit => 100,                    :null => false
    t.string  "code",                    :limit => 3,                      :null => false
    t.string  "locale",                  :limit => 6,                      :null => false
    t.integer "unicode_codepoint_start"
    t.integer "unicode_codepoint_end"
    t.boolean "use_for_interface",                      :default => false, :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string "fullname", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string "title",       :limit => 60, :null => false
    t.text   "description"
  end

  add_index "permissions", ["title"], :name => "index_permissions_on_title", :unique => true

  create_table "permissions_roles", :id => false, :force => true do |t|
    t.integer "permission_id", :null => false
    t.integer "role_id",       :null => false
  end

  add_index "permissions_roles", ["permission_id", "role_id"], :name => "index_permissions_roles_on_permission_id_and_role_id", :unique => true

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string "title",       :limit => 20, :null => false
    t.text   "description"
  end

  add_index "roles", ["title"], :name => "index_roles_on_title", :unique => true

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.string   "login",                     :limit => 80, :null => false
    t.string   "crypted_password",          :limit => 40
    t.string   "shibboleth_id"
    t.string   "email"
    t.string   "identity_url"
    t.string   "salt",                      :limit => 40
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
