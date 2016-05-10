require 'carrierwave/orm/activerecord'
class Country < ActiveRecord::Base
  has_many :city
  has_many :photo_reports
  mount_uploaders :images, ImagesUploader
end
