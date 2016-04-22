class Coordinate < ActiveRecord::Base
  has_one :cities
  has_one :country
  has_one :places


end
