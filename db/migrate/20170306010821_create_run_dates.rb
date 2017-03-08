class CreateRunDates < ActiveRecord::Migration
  def change
    create_table :run_dates do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
