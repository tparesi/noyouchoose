class PotentialRestaurant < ActiveRecord::Base
  validates :restaurant, :plan, presence: true

  has_many :swipe_rights, dependent: :destroy
  belongs_to :restaurant
  belongs_to :plan
end
