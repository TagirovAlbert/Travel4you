class AddUserRefToPhotoReport < ActiveRecord::Migration
  def change
    add_reference :photo_reports, :user, index: true, foreign_key: true
  end
end
