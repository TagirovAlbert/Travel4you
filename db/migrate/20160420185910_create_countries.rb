class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :visitors
      t.text :information
      t.text :history
      t.text :economic
      t.text :culture

      t.timestamps null: false
    end
  end
end
