class InformationCollectionRequest < ActiveRecord::Base
  include PgSearch
  has_and_belongs_to_many :contacts
  has_many :information_collections
  belongs_to :agency
  multisearchable :against => [:title, :abstract]

  def search_title
    "<b>#{title}</b> from #{agency.fullname}".html_safe
  end

  # create_table "information_collection_requests", force: :cascade do |t|
  #   t.string   "agency_id"
  #   t.string   "omb_control_number"
  #   t.string   "icr_reference_number"
  #   t.string   "title"
  #   t.text     "abstract"
  #   t.string   "icr_type_code"
  #   t.date     "expiration"
  #   t.string   "icr_status"
  #   t.boolean  "stimulus_indicator"
  #   t.boolean  "healthcare_indicator"
  #   t.boolean  "dodd_frank_act_indicator"
  #   t.text     "authorizing_statutes"
  #   t.integer  "burden_hour_total_quantity",              limit: 8
  #   t.integer  "burden_hour_previous_total_quantity",     limit: 8
  #   t.integer  "burden_cost_total_amount",                limit: 8
  #   t.integer  "burden_cost_previous_total_amount",       limit: 8
  #   t.integer  "burden_response_total_quantity",          limit: 8
  #   t.integer  "burden_response_previous_total_quantity", limit: 8
  #   t.date     "oira_conclusion_response_concluded_date"
  #   t.text     "oira_conclusion_concluded_terms"
  #   t.datetime "created_at",                                        null: false
  #   t.datetime "updated_at",                                        null: false
  # end
end
