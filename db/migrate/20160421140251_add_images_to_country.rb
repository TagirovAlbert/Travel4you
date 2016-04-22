class AddImagesToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :image, :string
  end
end
