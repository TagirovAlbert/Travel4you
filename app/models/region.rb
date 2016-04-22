class Region < ActiveRecord::Base
  belongs_to :country
  has_many :city
  has_one :coordinate
end
