class ImagesController < ApplicationController
  before_action :set_country

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @country.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @country.save
    redirect_to :back
  end

  private

  def set_country
    @country = Country.find(params[:country_id])
  end

  def add_more_images(new_images)
    images = @country.images
    images += new_images
    @country.images = images
  end

  def remove_image_at_index(index)
    remain_images = @country.images # copy the array
    remain_images.delete_at(index) # delete the target image
    @country.images = remain_images # re-assign back
  end

  def images_params
    params.require(:country).permit({images: []}) # allow nested params as array
  end
end
