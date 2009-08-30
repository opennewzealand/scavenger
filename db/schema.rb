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

ActiveRecord::Schema.define(:version => 20090830011322) do

  create_table "dataset_datas", :force => true do |t|
    t.string   "value"
    t.integer  "dataset_id"
    t.integer  "dataset_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dataset_entity_id"
  end

  create_table "dataset_entities", :force => true do |t|
    t.string   "name"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
  end

  create_table "dataset_fields", :force => true do |t|
    t.string   "name"
    t.text     "css"
    t.string   "data_type"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasets", :force => true do |t|
    t.string   "name"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
