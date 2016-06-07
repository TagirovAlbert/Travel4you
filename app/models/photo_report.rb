class PhotoReport < ActiveRecord::Base
  belongs_to :country
  belongs_to :city
  mount_uploaders :images, ImagesUploader

  attr_accessor :country_id, :region_id
end
