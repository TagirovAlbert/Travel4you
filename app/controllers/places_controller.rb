class PlacesController < ApplicationController
  respond_to :html

  expose(:place, attributes: :place_params)
  expose(:places) { Place.page(params[:page]) }

  def create
    flash[:notice] = 'Place was successfully created.' if place.save
    respond_with(place)
  end

  def update
    flash[:notice] = 'Place was successfully updated.' if place.save
    respond_with(place)
  end

  def destroy
    place.destroy
    respond_with(place)
  end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end
