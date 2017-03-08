class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :agency_id
      t.integer :information_collection_request_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone_number
      t.string :electronic_address
      t.string :suffix

      t.timestamps null: false
    end
  end
end
