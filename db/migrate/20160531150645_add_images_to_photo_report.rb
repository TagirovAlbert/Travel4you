class AddImagesToPhotoReport < ActiveRecord::Migration
  def change
    add_column :photo_reports, :images, :string, array: true, default: []
  end
end
