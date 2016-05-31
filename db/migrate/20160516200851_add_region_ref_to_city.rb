class AddRegionRefToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :region, index: true, foreign_key: true
  end
end
