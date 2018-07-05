class InstructionsController < ApplicationController
	skip_before_action :authorize

	def index
	end

	def create
		redirect_to login_path if start?
	end

	private
	def start?
		params[:commit] == "Start"
	end
	
end
