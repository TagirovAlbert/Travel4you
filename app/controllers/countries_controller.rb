class CountriesController < ApplicationController
  respond_to :html

  expose(:country, attributes: :country_params)
  expose(:countries) { Country.page(params[:page]) }

  def index
    if params[:search].present?

      @countries = Country.search(params[:search]).order("visitors DESC")
    else
      @countries = Country.all.order("visitors DESC")
    end
  end

  def test

  end

  def show
     country.increment(:visitors)
     country.save
     @hash = Gmaps4rails.build_markers(country.coordinate) do |coordinate, marker|
       marker.lat coordinate.latitude
       marker.lng coordinate.longitude
     end
     print(@hash)
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
   params.require(:country).permit(:name, :visitors, :information, :history,  :economic,  {images: []}, :culture)
  end

  def coordinate_params
    params.require(:country)[:coord]
  end


end
