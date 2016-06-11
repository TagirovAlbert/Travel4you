class PlacesController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, :except => [:my_show]
  expose(:place, attributes: :place_params)
  expose(:places) { Place.page(params[:page]) }


  def show
    place.increment(:visitors)
    place.save
    @coordinate = place.coordinate
    @hash = Gmaps4rails.build_markers(@coordinate) do |coordinate, marker|
      marker.lat coordinate.latitude
      marker.lng coordinate.longitude
    end

  end

  def create
    coordinate = Coordinate.create(address: coordinate_params[:address])
    city = City.find_by_id(place_params[:city_id])
    place.coordinate = coordinate
    place.city = city
    flash[:notice] = 'Place was successfully created.' if place.save
    redirect_to root_path
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
    params.require(:place).permit(:name, :description, :city_id, {images: []})
  end

  def coordinate_params
    params.require(:place).permit(:coord)
  end
end
