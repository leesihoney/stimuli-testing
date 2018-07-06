class SessionsController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id # signing in
      redirect_to instructions_path
    else
      @user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
      if @user.save
        session[:user_id] = @user.id # signing in
        redirect_to instructions_path
      else
        redirect_to login_path, danger: "Invalid Name or email"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, success: "Successfully Logged Out"
  end


end
