class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.timestamps null: false
    end
  end
end
