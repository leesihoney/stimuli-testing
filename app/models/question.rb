class Question < ApplicationRecord
  # validation
  belongs_to :user
  has_many :recipient

  def getDonationTypePic # returning string
  	foodtypeLinks = [
    "common.jpg",
    "lesscommon.jpg"]
    return foodtypeLinks[donation_type]
end

end
