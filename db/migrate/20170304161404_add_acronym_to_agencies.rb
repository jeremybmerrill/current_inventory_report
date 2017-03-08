class AddAcronymToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :acronym, :string
  end
end
