class AddCountryRefToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :country, index: true, foreign_key: true
  end
end
