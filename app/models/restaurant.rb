class Restaurant < ActiveRecord::Base
  validates :yelp_id, presence: true
  has_many :matches

  def yelp_data
    restaurant_data = Yelp.client.business(self.yelp_id)
    {id: self.id,
    name: restaurant_data.name,
    categories: restaurant_data.categories,
    mobile_url: restaurant_data.mobile_url,
    image_url: restaurant_data.image_url,
    rating: restaurant_data.rating,
    location: restaurant_data.location}
  end

end
