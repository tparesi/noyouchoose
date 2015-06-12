json.extract! @plan, :id, :name

json.users @plan.users do |user|
  json.name user.name
  json.id user.id
end

# json.restaurants @unswiped_restaurants.each do |potential_restaurant|
#   restaurant = Restaurant.find(potential_restaurant.restaurant_id).yelp_data
#   json.partial! 'api/restaurants/restaurant', restaurant: restaurant
# end

json.restaurants @unswiped_restaurants.each do |potential_restaurant|
  json.id potential_restaurant.restaurant.id
  # json.yelp_id potential_restaurant.restaurant.yelp_id
end
