class CreateDriverReports < ActiveRecord::Migration[6.1]
  def change
    create_table :driver_reports do |t|
      t.references :report, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
