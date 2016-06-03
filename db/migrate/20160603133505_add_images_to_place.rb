class AddImagesToPlace < ActiveRecord::Migration
  def change
    add_column :places, :images, :string, array: true, default: []
  end
end
