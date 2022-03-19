class CreateInsuranceCertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :insurance_certificates do |t|
      t.references :insurance_policy
      t.string :insurance_certification_number
      t.string :international_certification_number
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
