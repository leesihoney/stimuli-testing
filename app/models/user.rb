class User < ApplicationRecord
  # associations
  has_many :user_questions

  # validations:
	validates_presence_of :first_name, :last_name
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

	def name
		"#{first_name last_name}"
	end

end
