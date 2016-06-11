class PagesController < ApplicationController
  def home
    @countries = Country.all
  end

  def about_us

  end

  def profile
    @user = current_user
    @photo_reports = @user.photo_reports

  end

end
