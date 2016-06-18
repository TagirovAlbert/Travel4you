ActiveAdmin.register City do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :description, :country_id, :coordinate_id, :region_id, {images: []}
  form do |f|
    f.inputs "Изменить City" do
      f.input :name
      f.input :description
      f.collection_select :coordinate_id, Coordinate.all, :id, :address
      f.collection_select :country_id, Country.all.order(:name), :id, :name, {:prompt => "Выберете страну"}
      f.grouped_collection_select :region_id, Country.all.order(:name), :region, :name , :id, :name, {:prompt => "Выберите регион"}
      f.file_field :images, multiple: true

    end
    f.button "Изменить"
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
