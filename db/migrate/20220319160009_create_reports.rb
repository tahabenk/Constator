class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.datetime :accident_datetime
      t.string :address
      t.float :latitude
      t.float :longtitude
      t.boolean :flag_injury
      t.boolean :flag_other_damage
      t.string :visible_damages
      t.string :observations
      t.references :report_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
