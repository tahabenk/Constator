class CreateInsurancePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :insurance_policies do |t|

      t.timestamps
    end
  end
end
