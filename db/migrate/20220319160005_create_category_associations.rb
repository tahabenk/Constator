class CreateCategoryAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :category_associations do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :licence_category, null: false, foreign_key: true
      t.date :start_date

      t.timestamps
    end
  end
end
