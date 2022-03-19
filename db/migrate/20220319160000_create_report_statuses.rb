class CreateReportStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :report_statuses do |t|
      t.string :status_description

      t.timestamps
    end
  end
end
