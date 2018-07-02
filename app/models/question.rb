class Question < ApplicationRecord
  # validation
  belongs_to :user
  has_many :recipient

  def getDonationTypePic # returning string
  	foodtypeLinks = [
    "noborder_common_don.png",
    "noborder_lesscommon_don.png"]
    return foodtypeLinks[donation_type]
end

end
