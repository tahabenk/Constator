class Report < ApplicationRecord
  belongs_to :report_status
  belongs_to :accident_picture
end
