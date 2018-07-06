class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  add_flash_types :danger, :info, :warning, :success
  before_action :authorize
  
  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, warning: "Login needed"
    end
  end



	private
	#Handling authentication
	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    	rescue ActiveRecord::RecordNotFound
  	end
  	helper_method :current_user

  	def current_question
  		@current_question ||=Question.find(session[:user_id]) if session[:user_id]
  		rescue ActiveRecord::RecordNotFound
  	end
  	helper_method :current_questions

  	def logged_in?
    	current_user
  	end
  	helper_method :logged_in?

  	def check_login
    	redirect_to login_url, alert: "You need to log in to view this page" if current_user.nil?
  	end

    def todayRecord(uid)
      possible = Array.new
      today = DateTime.now.utc
      records = Question.where({user_id: uid}).order(:question_num)
      records.each do |record|
        recordDate = record.created_at
        if (recordDate.year == today.year) && (recordDate.month == today.month) && (recordDate.day == today.day)
          possible.push(record)
        end
      end
      return possible
    end
end
