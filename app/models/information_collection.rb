class InformationCollection < ActiveRecord::Base
  include PgSearch
  belongs_to :information_collection_request
  multisearchable :against => [:title, :line_of_business, :lob_subfunction, :cfr_citations]

  # create_table "information_collections", force: :cascade do |t|
  #   t.string   "title"
  #   t.boolean  "standard_form_indicator"
  #   t.string   "obligation_code"
  #   t.string   "line_of_business"
  #   t.string   "lob_subfunction"
  #   t.string   "affected_public_code"
  #   t.integer  "number_responses",                  limit: 8
  #   t.integer  "burden_cost_total",                 limit: 8
  #   t.integer  "burden_hour_total",                 limit: 8
  #   t.string   "response_frequency"
  #   t.text     "cfr_citations"
  #   t.integer  "information_collection_request_id"
  #   t.datetime "created_at",                                  null: false
  #   t.datetime "updated_at",                                  null: false
  # end

  def search_title
    information_collection_request && information_collection_request.agency ? "<b>#{title}</b> from #{information_collection_request.agency.fullname}".html_safe : "<b>#{title}</b>".html_safe
  end

  def desc
    "#{title} #{rest_of_desc}"
  end
  alias_method :desc, :to_s

  def rest_of_desc
    "for #{affected_public_code} in #{line_of_business} / #{lob_subfunction}, #{obligation_code}"
  end
end