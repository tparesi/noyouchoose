class PotentialRestaurant < ActiveRecord::Base
  validates :restaurant, :plan, presence: true

  belongs_to :restaurant
  belongs_to :plan
  has_many :swipe_rights, dependent: :destroy
  has_many :swipe_lefts, dependent: :destroy

  def is_match?
    swipe_rights.count == plan.users.count
  end

end
