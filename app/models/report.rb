class Report < ApplicationRecord
  belongs_to :report_status
  has_one :user
  has_one :report_declaration
  has_one :declaration, through: :report_declarations
  has_many :driver_reports
  has_many :drivers, through: :driver_reports
  has_many :vehicle_associations
  has_many :vehicles, through: :vehicle_associations

end
