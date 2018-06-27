class User < ApplicationRecord
  # associations
  has_many :questions

  # validations:
	validates_presence_of :first_name, :last_name
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence       => true,
            :format                 => { :with => VALID_EMAIL_REGEX },
            :uniqueness             => { :case_sensitive => false}

	def name
		"#{first_name last_name}"
	end

	def all_question_ids
		return self.user_questions.map(&:question_id)
	end

end
