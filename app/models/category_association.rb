class CategoryAssocation < ActiveRecord::Base
  belongs_to :driver
  belongs_to :licence_category
end
