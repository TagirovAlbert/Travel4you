class AddCityRefToPhotoReport < ActiveRecord::Migration
  def change
    add_reference :photo_reports, :city, index: true, foreign_key: true
  end
end
