class Contact < ActiveRecord::Base
  has_and_belongs_to_many :information_collection_requests
  # belongs_to :agency # maybe

  def name
    [first_name, middle_name, last_name, suffix].compact.join(" ")
  end
end
