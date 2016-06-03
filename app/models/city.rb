require 'carrierwave/orm/activerecord'
class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
  belongs_to :coordinate
  has_many :photo_reports
  has_many :places
  mount_uploaders :images, ImagesUploader

end
