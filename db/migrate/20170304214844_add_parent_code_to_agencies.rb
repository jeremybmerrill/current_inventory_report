class AddParentCodeToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :parent_code, :integer
    add_column :agencies, :parent_id, :integer
  end
end
