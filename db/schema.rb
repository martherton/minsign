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

ActiveRecord::Schema.define(version: 20150223120906) do

  create_table "comments", force: :cascade do |t|
    t.text     "contentcom"
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "declaratives", force: :cascade do |t|
    t.string   "urlsource"
    t.text     "declarativetext"
    t.text     "declarativejusttext"
    t.integer  "datapoint"
    t.string   "units"
    t.text     "entryhierarchy"
    t.string   "texttype"
    t.boolean  "entryend",                      null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "declarativeimage_file_name"
    t.string   "declarativeimage_content_type"
    t.integer  "declarativeimage_file_size"
    t.datetime "declarativeimage_updated_at"
    t.integer  "user_id"
    t.integer  "linkcat_id"
    t.integer  "docstructure_id"
    t.boolean  "endsection",                    null: false
    t.string   "urlextra"
    t.boolean  "sandbox",                       null: false
    t.string   "listtitle"
    t.date     "reviewdate"
    t.string   "listtext"
  end

  create_table "docstructures", force: :cascade do |t|
    t.string   "headingname"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.boolean  "released",    null: false
    t.boolean  "sandbox",     null: false
    t.boolean  "liveissue",   null: false
  end

  create_table "finds", force: :cascade do |t|
    t.string   "searchterm"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "linkcat_id"
    t.integer  "docstructure_id"
    t.string   "tag_list_tokens"
  end

  create_table "friendships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "approved"
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  create_table "linkcats", force: :cascade do |t|
    t.string   "linkcatname"
    t.string   "linkcattype"
    t.text     "linkcatdesc"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "linkcatview"
    t.integer  "linkcatmaxres"
    t.boolean  "released",      null: false
    t.boolean  "sandbox",       null: false
  end

  create_table "linkcats_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "linkcat_id"
  end

  add_index "linkcats_users", ["linkcat_id"], name: "index_linkcats_users_on_linkcat_id"
  add_index "linkcats_users", ["user_id"], name: "index_linkcats_users_on_user_id"

  create_table "moreinfos", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "approved",               default: false, null: false
    t.boolean  "extrainfo",              default: false, null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "company"
    t.string   "position"
    t.string   "mpackage"
    t.boolean  "freeuser"
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "wlinks", force: :cascade do |t|
    t.string   "wlinkname"
    t.string   "wlinkurl"
    t.string   "wlinkdesc"
    t.string   "wlinkveri"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "linkcat_id"
    t.string   "wlinksource"
    t.date     "wlinkyear"
    t.string   "wlinklang"
  end

end
