class AddCoordinateRefToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :coordinate, index: true, foreign_key: true
  end
end
