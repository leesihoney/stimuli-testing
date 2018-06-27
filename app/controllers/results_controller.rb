class ResultsController < ApplicationController
	def index
		user_id = current_user.id
		questions = todayRecord(user_id)
		questions.sort_by{|question| question.question_num}
		@result = Array.new
		questions.each do |question|
			recipientA = Recipient.where({id: question.recipientA_id}).first
			recipientB = Recipient.where({id: question.recipientB_id}).first
			puts("Question %d" % [question.question_num])
			puts("Recipient Organization Size : %d" % [recipientA.organization_size])
			if question.recipient_choice == "A"
				@result.push([recipientA, question])
			elsif question.recipient_choice == "B"
				@result.push([recipientB, question])
			end
		end
	end
end
