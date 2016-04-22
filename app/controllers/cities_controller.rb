class CitiesController < ApplicationController
  respond_to :html

  expose(:city, attributes: :city_params)
  expose(:cities) { City.page(params[:page]) }

  def create
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

  private

  def city_params
    params.require(:city).permit(:name, :description, :visitors)
  end
end
