# == Schema Information
#
# Table name: potential_restaurants
#
#  id            :integer          not null, primary key
#  restaurant_id :integer          not null
#  plan_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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
