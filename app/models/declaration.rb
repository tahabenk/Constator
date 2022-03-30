class Declaration < ApplicationRecord
  belongs_to :insurance_policy
  belongs_to :report_declaration
  has_one :report, through: :report_declarations
end
