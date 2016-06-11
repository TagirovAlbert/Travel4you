class UsersController < ApplicationController

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    @user=User.find(params[:id])
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
       # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Ваш профиль удачно обновлён.'
      else
        @show_errors = true
      end
    end
  end


  private

  def user_params
    accessible = [ :first_name, :last_name, :email, :login ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end