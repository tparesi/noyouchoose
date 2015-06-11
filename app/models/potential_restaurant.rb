class PotentialRestaurant < ActiveRecord::Base
  validates :restaurant, :plan, presence: true

  belongs_to :restaurant
  belongs_to :plan
  has_many :swipe_rights, dependent: :destroy
end
