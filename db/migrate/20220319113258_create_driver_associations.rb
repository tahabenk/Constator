class CreateDriverAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :driver_associations do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
