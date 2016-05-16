class Region < ActiveRecord::Base
  belongs_to :country
  has_many :city
  belongs_to :coordinate
  mount_uploaders :images, ImagesUploader
end
