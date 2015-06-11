class SwipeLeft < ActiveRecord::Base
  validates :potential_restaurant_id, :user_id, presence: true

  belongs_to :potential_restaurant
  belongs_to :user
end
