class AddCoordinateRefToRegion < ActiveRecord::Migration
  def change
    add_reference :regions, :coordinate, index: true, foreign_key: true
  end
end
