class Plan < ActiveRecord::Base
  validates :time, :name, presence: true

  has_many :users_plans
  has_many :users, through: :users_plans
  has_many :plans_cuisines
  has_many :cuisines, through: :plans_cuisines
  has_many :potential_restaurants, inverse_of: :plan
  has_many :pending_restaurants, through: :potential_restaurants, source: :restaurant

  def restaurants_yelp_data
    restaurants = []
    pending_restaurants.each do |restaurant|
      restaurants << Yelp.client.business(restaurant.yelp_id)
    end

    restaurants
  end
end
