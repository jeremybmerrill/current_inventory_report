class CreateContactsInformationCollectionRequests < ActiveRecord::Migration
  def change
    create_table :contacts_information_collection_requests do |t|
      t.integer :contact_id
      t.integer :information_collection_request_id
    end
  end
end
