class CreateReportDeclarations < ActiveRecord::Migration[6.1]
  def change
    create_table :report_declarations do |t|
      t.references :report, null: false, foreign_key: true
      t.references :declaration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
