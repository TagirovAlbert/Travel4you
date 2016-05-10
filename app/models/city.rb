require 'carrierwave/orm/activerecord'
class City < ActiveRecord::Base
  belongs_to :country
  has_one :coordinate
  has_many :photo_report
  mount_uploader :image, ImageUploader
end
