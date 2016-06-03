class AddCountryRefToPhotoReport < ActiveRecord::Migration
  def change
    add_reference :photo_reports, :country, index: true, foreign_key: true
  end
end
