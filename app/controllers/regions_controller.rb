class RegionsController < ApplicationController
  respond_to :html

  expose(:region, attributes: :region_params)
  expose(:regions) { Region.page(params[:page]) }

  def create
    flash[:notice] = 'Region was successfully created.' if region.save
    respond_with(region)
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
    params.require(:region).permit(:name, :description, :visitors)
  end
end
