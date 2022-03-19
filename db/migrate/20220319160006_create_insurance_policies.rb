class CreateInsurancePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :insurance_policies do |t|
      t.string :insured_name
      t.string :insured_last_name
      t.string :address
      t.string :insurance_company_name
      t.string :policy_number
      t.string :insurance_certification_number
      t.string :international_certification_number
      t.datetime :start_date
      t.datetime :end_time

      t.timestamps
    end
  end
end
