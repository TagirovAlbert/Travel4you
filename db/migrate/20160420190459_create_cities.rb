class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.text :description
      t.integer :visitors, :default => 0

      t.timestamps null: false
    end
  end
end
