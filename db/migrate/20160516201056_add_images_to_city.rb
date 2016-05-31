class AddImagesToCity < ActiveRecord::Migration
  def change
    add_column :cities, :images, :string, array: true, default: []
  end
end
