class Place < ActiveRecord::Base
  has_one :coordinate
  belongs_to :city
end
