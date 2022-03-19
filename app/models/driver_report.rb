class DriverReport < ApplicationRecord
  belongs_to :report
  belongs_to :driver
end
