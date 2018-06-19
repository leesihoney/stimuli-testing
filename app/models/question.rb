class Question < ApplicationRecord
  # validation
  has_many :user_questions
end
