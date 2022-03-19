class InsurancePolicy < ApplicationRecord
  has_many :insurance_certificates
  has_many :declarations
end
