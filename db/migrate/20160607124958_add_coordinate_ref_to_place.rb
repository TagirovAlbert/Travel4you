class AddCoordinateRefToPlace < ActiveRecord::Migration
  def change
    add_reference :places, :coordinate, index: true, foreign_key: true
  end
end
