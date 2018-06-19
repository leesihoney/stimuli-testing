class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:email])
      sessions[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Login Failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Successfully Logged Out"
  end
end
