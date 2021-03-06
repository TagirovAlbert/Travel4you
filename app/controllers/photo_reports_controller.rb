class PhotoReportsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, :except => [:show, :index]
  expose(:photo_report, attributes: :photo_report_params)
  expose(:photo_reports) { PhotoReport.page(params[:page]) }

  def create
    city = City.find_by_id(photo_report_params[:city_id])
    country = city.country
    photo_report.user =current_user
    photo_report.city = city
    photo_report.country = country
    flash[:notice] = 'Photo report was successfully created.' if photo_report.save
    respond_with(photo_report)
  end

  def index
    @photo_reports = PhotoReport.all.order("created_at DESC")
    @city_of_report = Array.new
    for elem in @photo_reports
      @city_of_report.append(elem.city.name)
    end
  end

  def show
    photo_report.increment(:visitors)
    photo_report.save
    @user = photo_report.user.decorate
  end

  def update
    flash[:notice] = 'Photo report was successfully updated.' if photo_report.save
    respond_with(photo_report)
  end

  def destroy
    photo_report.destroy
    respond_with(photo_report)
  end

  private

  def photo_report_params
    params.require(:photo_report).permit(:name, :description, :city_id,{images: []})
  end



end
