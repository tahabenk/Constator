class Driver < ApplicationRecord
  belongs_to :user
  has_many :driver_reports
  has_many :reports, through: :driver_reports
  has_many :category_associations
  has_many :licence_categories, through: :category_associations
end
