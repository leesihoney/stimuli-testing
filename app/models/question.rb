class Question < ApplicationRecord
  # validation
  belongs_to :user
  attr_accessor :donation_type

  def getDonationTypePic # returning string
  	foodtypeLinks = [
    "common.jpg",
    "lesscommon.jpg"]
    return foodtypeLinks[donation_type]
end

end
