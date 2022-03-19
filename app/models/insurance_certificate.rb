class InsuranceCertificate < ApplicationRecord
  belongs_to :insurance_policy
  has_one :vehicle
end
