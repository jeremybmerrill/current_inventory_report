class AddBoringToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :boring, :boolean
  end
end
