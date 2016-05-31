class ImagesController < ApplicationController
  before_action :set_object

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @object_set.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @object_set.save
    redirect_to :back
  end

  private

  def set_object
    @object_set = PhotoReport.find(params[:photo_report_id])
  end



  def add_more_images(new_images)
    images = @object_set.images
    images += new_images
    @object_set.images = images
  end

  def remove_image_at_index(index)
    remain_images = @object_set.images # copy the array
    remain_images.delete_at(index) # delete the target image
    @object_set.images = remain_images # re-assign back
  end

  def images_params

     params.require(:photo_report).permit({images: []}) # allow nested params as array
  end


end
