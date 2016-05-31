class CitiesController < ApplicationController
  respond_to :html

  expose(:city, attributes: :city_params)
  expose(:cities) { City.page(params[:page]) }

  def index
    @cities = City.all.order("visitors DESC")
  end

  def show
    city.increment(:visitors)
    city.save
    @coordinate = city.coordinate
    @hash = Gmaps4rails.build_markers(@coordinate) do |coordinate, marker|
      marker.lat coordinate.latitude
      marker.lng coordinate.longitude
    end
  end

  def create
    country = Country.find_by_id(city_params[:country_id])
    region = Region.find_by_id(city_params[:region_id])
    coordinate = Coordinate.create(address: coordinate_params[:address])
    city.coordinate = Coordinate.create(address: coordinate_params[:address])
    city.country = country
    city.region = region
    flash[:notice] = 'City was successfully created.' if city.save
    respond_with(city)
  end

  def update
    flash[:notice] = 'City was successfully updated.' if city.save
    respond_with(city)
  end

  def destroy
    city.destroy
    respond_with(city)
  end

  def get_regions
    @country = Country.find_by_id(country_params)
    print(@country)
    @regions = @country.regions
  end

  private

  def city_params
    params.require(:city).permit(:name, :description, :country_id, :region_id,  {images: []})
  end

  def coordinate_params
    params.require(:city)[:coord]
  end

end
