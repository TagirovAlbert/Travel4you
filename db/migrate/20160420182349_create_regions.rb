class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.integer :visitors, :default => 0

      t.timestamps null: false
    end
  end
end
