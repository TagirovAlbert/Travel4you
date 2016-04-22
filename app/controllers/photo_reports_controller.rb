class PhotoReportsController < ApplicationController
  respond_to :html

  expose(:photo_report, attributes: :photo_report_params)
  expose(:photo_reports) { PhotoReport.page(params[:page]) }

  def create
    flash[:notice] = 'Photo report was successfully created.' if photo_report.save
    respond_with(photo_report)
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
    params.require(:photo_report).permit(:name, :description, :visitors)
  end
end
