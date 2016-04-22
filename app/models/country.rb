require 'carrierwave/orm/activerecord'
class Country < ActiveRecord::Base
  has_many :city
  mount_uploader :image, ImageUploader
end
