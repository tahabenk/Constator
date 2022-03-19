class DriverAssociation < ApplicationRecord
  belongs_to :driver
  belongs_to :report
end
