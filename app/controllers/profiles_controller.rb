class ProfilesController < ApplicationController

  def show_profiles
    @user = User.find_by_login(params[:login])

  end

end