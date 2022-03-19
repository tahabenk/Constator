class CreateLicenceCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :licence_categories do |t|
      t.string :type
      t.string :type_name

      t.timestamps
    end
  end
end
