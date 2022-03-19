class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :registration_number
      t.string :chassis_number
      t.references :insurance_policy, null: false, foreign_key: true
      t.integer :gross_weight

      t.timestamps
    end
  end
end
