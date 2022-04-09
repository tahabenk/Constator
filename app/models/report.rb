class Report < ApplicationRecord
  belongs_to :report_status
  has_one :user
  has_one :report_declaration
  has_one :declaration, through: :report_declarations
  has_many :driver_reports
  has_many :drivers, through: :driver_reports
  has_many :vehicle_associations
  has_many :vehicles, through: :vehicle_associations
  has_many_attached :signatures

  #     @users_on_report = User.joins(driver: :driver_reports).where(driver_reports: { report_id: self.id }).to_a
  #   # @users_on_report = User.joins(:drivers, :driver_reports).where(driver_reports: { report_id: @report.id }).distinct
  #     if @users_on_report.include?(current_user)
  #       return "driver 2"
  #     else
  #       return "other"
  #     end
  #   end
  # end

end
