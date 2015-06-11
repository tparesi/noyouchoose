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
      restaurant_data = Yelp.client.business(restaurant.yelp_id)
      restaurants << {id: restaurant.id,
                      name: restaurant_data.name,
                      categories: restaurant_data.categories,
                      mobile_url: restaurant_data.mobile_url,
                      image_url: restaurant_data.image_url,
                      rating: restaurant_data.rating,
                      location: restaurant_data.location}
    end

    restaurants
  end

end
