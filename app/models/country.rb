require 'carrierwave/orm/activerecord'
class Country < ActiveRecord::Base
  has_many :region
  has_many :city
  has_many :photo_reports
  belongs_to :coordinate
  mount_uploaders :images, ImagesUploader
  accepts_nested_attributes_for :coordinate

  def self.search(search)
   where("name ILIKE ?", "%#{search}%")

  end

end
