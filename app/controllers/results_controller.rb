class ResultsController < ApplicationController
	def index
		user_id = current_user.id
		questions = todayRecord(user_id)
		@count = 0
		@result = Array.new
		questions.each do |question|
			recipientA = Recipient.where({id: question.recipientA_id}).first
			recipientB = Recipient.where({id: question.recipientB_id}).first
			if question.recipient_choice == "A"
				@result.push([recipientA, question])
				@count += 1
			elsif question.recipient_choice == "B"
				@result.push([recipientB, question])
				@count += 1
			else
				@result.push([nil, question])
			end
		end
	end
end
