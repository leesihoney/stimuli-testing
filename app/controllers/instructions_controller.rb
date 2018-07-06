class InstructionsController < ApplicationController

	def index
	end

	def create
		redirect_to new_question_path if start?
	end

	private
	def start?
		params[:commit] == "Start"
	end
	
end
