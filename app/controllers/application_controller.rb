class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize
	
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access Denied."
		redirect_to login_path
	end
end
