class RegionsController < ApplicationController
  respond_to :html

  expose(:region, attributes: :region_params)
  expose(:regions) { Region.page(params[:page]) }

  def create
    coordinate = Coordinate.create(address: coordinate_params[:address])
    country = Country.find_by_id(region_params[:country_id])
    region.country = country
    region.coordinate = coordinate
    flash[:notice] = 'Region was successfully created.' if region.save
    respond_with(region)
  end

  def index

    @regions = Region.all.order("visitors DESC")
  end

  def show
    region.increment(:visitors)
    region.save
    @coordinate = region.coordinate
    @hash = Gmaps4rails.build_markers(@coordinate) do |coordinate, marker|
      marker.lat coordinate.latitude
      marker.lng coordinate.longitude
    end
  end

  def update
    flash[:notice] = 'Region was successfully updated.' if region.save
    respond_with(region)
  end

  def destroy
    region.destroy
    respond_with(region)
  end

  private

  def region_params
    params.require(:region).permit(:name, :description, :country_id   , {images: []})
  end

  def coordinate_params
    params.require(:region)[:coord]
  end

end
