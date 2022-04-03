class Declaration < ApplicationRecord
  belongs_to :insurance_policy
  belongs_to :report
end
