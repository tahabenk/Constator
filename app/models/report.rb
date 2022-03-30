class Report < ApplicationRecord
  has_one :report_status
  has_one :report_declaration
  has_one :declaration
end
