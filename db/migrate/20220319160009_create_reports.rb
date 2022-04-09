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
      t.string :status_comment
      t.integer :driver_1_id, null: false
      t.integer :driver_2_id, null: true
      t.integer :vehicle_1_id, null: false
      t.integer :vehicle_2_id, null: true
      t.references :report_status, null: false

      t.timestamps
    end

  end
end
