class UserQuestion < ApplicationRecord
  # associations
  belongs_to :users
  belongs_to :questions
end
