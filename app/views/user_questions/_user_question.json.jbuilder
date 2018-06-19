json.extract! user_question, :id, :recipient_choice, :question_num, :created_at, :updated_at
json.url user_question_url(user_question, format: :json)
