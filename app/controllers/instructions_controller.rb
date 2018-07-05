class InstructionsController < ApplicationController
	def index
	end

	def create
		redirect_to login_path if start?
	end


	def start?
		params[:commit] == "Start"
	end
	
end
