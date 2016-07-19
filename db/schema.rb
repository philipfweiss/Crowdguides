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

ActiveRecord::Schema.define(version: 20160719182139) do

  create_table "advices", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "inner_guide_id"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "advices", ["guide_id"], name: "index_advices_on_guide_id"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guides", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "content"
  end

  add_index "guides", ["user_id", "created_at"], name: "index_guides_on_user_id_and_created_at"
  add_index "guides", ["user_id"], name: "index_guides_on_user_id"

  create_table "tidbits", force: :cascade do |t|
    t.integer  "advice_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "issue_type"
  end

  add_index "tidbits", ["advice_id"], name: "index_tidbits_on_advice_id"
  add_index "tidbits", ["user_id"], name: "index_tidbits_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
