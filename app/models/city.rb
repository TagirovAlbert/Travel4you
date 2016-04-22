class City < ActiveRecord::Base
  belongs_to :country
  has_one :coordinate
  has_many :photo_report
end
