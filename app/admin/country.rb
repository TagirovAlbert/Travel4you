ActiveAdmin.register Country do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
 permit_params :name, :information, :history, :economic,:coordinate_id,  :culture, {images: []}
 form do |f|
  f.inputs "Изменить Country" do
   f.input :name
   f.input :information
   f.input :economic
   f.input :culture
   f.input :history

   f.collection_select :coordinate_id, Coordinate.all, :id, :address, {:prompt => "Выберете координату"}
   br
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
