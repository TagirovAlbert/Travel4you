class CreatePhotoReports < ActiveRecord::Migration
  def change
    create_table :photo_reports do |t|
      t.string :name
      t.text :description
      t.integer :visitors

      t.timestamps null: false
    end
  end
end
