class Vehicle < ApplicationRecord
  has_many :vehicle_associations
  has_many :reports, through: :vehicle_associations
  has_one :insurance_policy, through: :insurance_certificates
end
