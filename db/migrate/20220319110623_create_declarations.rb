class CreateDeclarations < ActiveRecord::Migration[6.1]
  def change
    create_table :declarations do |t|
      t.boolean :flag_police_report
      t.boolean :flag_police_statement
      t.string :police_station
      t.boolean :flag_usual_driver
      t.boolean :flag_usual_resident
      t.boolean :flag_single
      t.boolean :flag_employee
      t.string :driving_reason
      t.string :usual_parking_place
      t.string :expertise_garage
      t.string :expertise_date
      t.string :expertise_phone_contact
      t.integer :trailing_vehicule_registration_number
      t.string :other_damages_description
      t.string :other_damages_thirdparty_name
      t.string :other_damages_thirdparty_address
      t.date :declaration_datetime

      t.timestamps
    end
  end
end
