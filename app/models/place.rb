class Place < ActiveRecord::Base
  has_one :coordinate
  belongs_to :city
  mount_uploaders :images, ImagesUploader
end
