class DriverCategory < ApplicationRecord
  belongs_to :driver
  belongs_to :driver_licence_category
end
