class PotentialRestaurant < ActiveRecord::Base
  validates :restaurant_id, :plan_id, presence: true

  has_many :swipe_rights, dependent: :destroy
  belongs_to :restaurant
  belongs_to :plan
end
