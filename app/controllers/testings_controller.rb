class TestingsController < ApplicationController
	def index
	end

	def show
	end

	def create
		# create instances for recipient A, B and a question
		@recipientA = setRecipient(Recipient.new)
		@recipientB = setRecipient(Recipient.new)
		@question = setQuestion(Question.new, @recipientA.id, @recipientB.id)

		# make a new user_question table
		if logged_in?
			@user = current_user
			questionNum = findQuestionNum(@question, @user.id)

	end

	private
	def setRecipient(recipient)
		# randomly select which question to compare
		organizationSize = [*0..4].sample(1)
		travelTime = [*0..3].sample(1)
		foodAccess = [*0..2].sample(1)
		incomeLevel = [*0..5].sample(1)
		povertyLevel = nil
		lastDonation = [*0..12].sample(1)
		totalDonation = [*0..91].sample(1)
		# last donation & total donation combo
		if lastDonation == 0
			totalDonation = 0
		elsif totalDonation == 0
			lastDonation = 0
		end

		# income level & poverty level combo 
		if incomeLevel == 0
			povertyLevel = [*2..6].sample(1)
		elsif incomeLevel == 1 or incomeLevel == 2
			povertyLevel = [*0..4].sample(1)
		else
			povertyLevel = [*0..2].sample(1)
		end

		# set recipients with corresponding values
		recipient.attributes = {
			organization_size: organizationSize,
			food_access: foodAccess,
			income_level: incomeLevel,
			poverty_level: povertyLevel,
			last_donation: lastDonation,
			total_donation: totalDonation,
			travel_time: travelTime
		}

		return recipient
	end

	def setQuestion(q, rA, rB)
		# randomly generate food type
		donationType = [*0..1].sample(1)
		# set a question with corresponding values
		q.attributes = {
			donation_type: donationType,
			recipientA_id: rA,
			recipientB_id: rB
		}
		return q
	end

	def checkQuestionNum(q, uid)
		today = Date.today
		todayQueryNum = ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM user_questions WHERE user_id = uid and created_at.year = today.year and created_at.month = today.month and created_at.day = today.day")
		# check whether this is the first log
		if todayQueryNum == 0 
			return 1
		else
			return ActiveRecord::Base.connection.exec_query("SELECT question_num FROM user_questions WHERE user_id = uid and created_at.year = today.year and created_at.month = today.month and created_at.day = today.day and recipient_choice = nil")





		



end
