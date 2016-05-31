class AddImagesToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :images, :string, array: true, default: []
  end
end
