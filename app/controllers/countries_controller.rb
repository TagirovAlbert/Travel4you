class CountriesController < ApplicationController
  respond_to :html

  expose(:country, attributes: :country_params)
  expose(:countries) { Country.page(params[:page]) }

  def index

      @countries = Country.all.order("visitors DESC")
   end

  def test
    @coordinate = Country.first.coordinate
    @hash = Gmaps4rails.build_markers(@coordinate) do |coordinate, marker|
      marker.lat coordinate.latitude
      marker.lng coordinate.longitude
    end
  end

  def show
     country.increment(:visitors)
     country.save
     @coordinate = country.coordinate
     @hash = Gmaps4rails.build_markers(@coordinate) do |coordinate, marker|
       marker.lat coordinate.latitude
       marker.lng coordinate.longitude
     end
     @regions = country.region.order("name DESC")

     @cities = country.city.order("visitors DESC").limit(10)
  end

  def create
    coordinate = Coordinate.create(address: coordinate_params[:address])
    country.coordinate = coordinate
    flash[:notice] = 'Country was successfully created.' if country.save
    respond_with(country)
  end

  def update
    flash[:notice] = 'Country was successfully updated.' if country.save
    respond_with(country)
  end

  def destroy
    country.destroy
    respond_with(country)
  end

  private

  def country_params
   params.require(:country).permit(:name,  :information, :history,  :economic,  {images: []}, :culture)
  end

  def coordinate_params
    params.require(:country)[:coord]
  end


end
