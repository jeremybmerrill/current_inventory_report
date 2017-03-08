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

ActiveRecord::Schema.define(version: 20170306010821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "acronym"
    t.integer  "parent_code"
    t.integer  "parent_id"
    t.boolean  "boring"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "agency_id"
    t.integer  "information_collection_request_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "electronic_address"
    t.string   "suffix"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "contacts_information_collection_requests", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "information_collection_request_id"
  end

  create_table "information_collection_requests", force: :cascade do |t|
    t.string   "agency_id"
    t.string   "omb_control_number"
    t.string   "icr_reference_number"
    t.string   "title"
    t.text     "abstract"
    t.string   "icr_type_code"
    t.date     "expiration"
    t.string   "icr_status"
    t.boolean  "stimulus_indicator"
    t.boolean  "healthcare_indicator"
    t.boolean  "dodd_frank_act_indicator"
    t.text     "authorizing_statutes"
    t.integer  "burden_hour_total_quantity",              limit: 8
    t.integer  "burden_hour_previous_total_quantity",     limit: 8
    t.integer  "burden_cost_total_amount",                limit: 8
    t.integer  "burden_cost_previous_total_amount",       limit: 8
    t.integer  "burden_response_total_quantity",          limit: 8
    t.integer  "burden_response_previous_total_quantity", limit: 8
    t.date     "oira_conclusion_response_concluded_date"
    t.text     "oira_conclusion_concluded_terms"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "information_collections", force: :cascade do |t|
    t.string   "title"
    t.boolean  "standard_form_indicator"
    t.string   "obligation_code"
    t.string   "line_of_business"
    t.string   "lob_subfunction"
    t.string   "affected_public_code"
    t.integer  "number_responses",                  limit: 8
    t.integer  "burden_cost_total",                 limit: 8
    t.integer  "burden_hour_total",                 limit: 8
    t.string   "response_frequency"
    t.text     "cfr_citations"
    t.integer  "information_collection_request_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "run_dates", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
