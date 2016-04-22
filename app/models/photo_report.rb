class PhotoReport < ActiveRecord::Base
  has_many :paragraph
  belongs_to :city
end
