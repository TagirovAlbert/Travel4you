class AddCoordinateRefToCountry < ActiveRecord::Migration
  def change
    add_reference :countries, :coordinate, index: true, foreign_key: true
  end
end
