class ProfilesController < ApplicationController

  def show
    @user = User.find_by_login(params[:login])
    @photo_reports = @user.photo_reports
  end

end