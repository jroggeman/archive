class SessionsController < ApplicationController
  def new
  end

  def login
    user = User.find_by_email(login_params[:email])

    if user
      session[:user_id] = user.id
      redirect_to documents_url
    else
      flash[:error] = "Unable to find user."
      redirect_to login_url
    end
  end

  def logout
    session[:user_id] = nil
  end

  private

    def login_params
      params.require(:user).permit(:email, :password)
    end
end
