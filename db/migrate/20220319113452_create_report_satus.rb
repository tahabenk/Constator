class CreateReportSatus < ActiveRecord::Migration[6.1]
  def change
    create_table :report_satus do |t|
      t.string :status_description

      t.timestamps
    end
  end
end
