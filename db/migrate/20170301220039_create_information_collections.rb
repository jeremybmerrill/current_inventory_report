class CreateInformationCollections < ActiveRecord::Migration
  def change
    create_table :information_collections do |t|
      t.string :title
      t.boolean :standard_form_indicator
      t.string :obligation_code
      t.string :line_of_business
      t.string :lob_subfunction
      t.string :affected_public_code
      t.integer :number_responses
      t.integer :burden_cost_total, :limit => 8
      t.integer :burden_hour_total, :limit => 8
      t.string :response_frequency
      t.text :cfr_citations
      t.integer :information_collection_request_id

      t.timestamps null: false
    end
  end
end
