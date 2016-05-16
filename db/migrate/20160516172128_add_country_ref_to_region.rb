class AddCountryRefToRegion < ActiveRecord::Migration
  def change
    add_reference :regions, :country, index: true, foreign_key: true
  end
end
