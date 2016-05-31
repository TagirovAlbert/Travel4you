class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.integer :visitors, :default => 0
      t.timestamps null: false
    end
  end
end
