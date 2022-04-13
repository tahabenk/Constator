class Vehicle < ApplicationRecord
  has_many :vehicle_associations
  has_many :reports, through: :vehicle_associations
  has_many :insurance_certificates
  has_one :insurance_policy, through: :insurance_certificates
  belongs_to :user

  def vehicle_name
      "#{id} - #{registration_number}, #{brand} #{model}"
  end
end
