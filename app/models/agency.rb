class Agency < ActiveRecord::Base
  has_many :information_collection_requests
  has_many :subagencies, class_name: "Agency",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "Agency", foreign_key: "parent_id"
    # create_table "agencies", force: :cascade do |t|
    # t.string   "name"
    # t.integer  "code"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
    # t.string   "acronym"
    # t.integer  "parent_code"
    # t.integer  "parent_id"


  def fullname
    "#{name}" + (parent.nil? ? "" : " (#{parent.name})")
  end

  def is_parent?
    code == (code.to_i / 100) * 100
  end

  def to_s
    title
  end 
end
