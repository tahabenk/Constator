class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :driver_licence_number
      t.date :driver_licence_end_date

      t.timestamps
    end
  end
end
