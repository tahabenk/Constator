class CreateVehicleAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_associations do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
