class AddCoordinateRefToCountry < ActiveRecord::Migration
  def change
    add_reference :countries, :country, index: true, foreign_key: true
  end
end
