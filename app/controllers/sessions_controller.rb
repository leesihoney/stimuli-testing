class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      redirect_to login_url, alert: "Invalid Name or email"
    else
      sessions[:user_id] = user.id # signing in
      redirect_to admin_url

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Successfully Logged Out"
  end
end
