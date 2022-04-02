class Report < ApplicationRecord
  belongs_to :report_status
  has_one :report_declaration
  has_one :declaration, through: :report_declarations
end
