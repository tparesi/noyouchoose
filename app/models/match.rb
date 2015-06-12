class Match < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :plan

  def to_json(options)
    { id: id, restaurant: restaurant.yelp_data[:name] }
  end
end
