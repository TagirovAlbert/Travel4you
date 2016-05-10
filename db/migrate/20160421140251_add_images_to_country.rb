class AddImagesToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :images, :string, array: true, default: []
  end
end
