class SessionsController < ApplicationController
  skip_authentication only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to documents_url
    else
      flash.now[:error] = "Unable to login."
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

    def login_params
      params.require(:user).permit(:email, :password)
    end
end
