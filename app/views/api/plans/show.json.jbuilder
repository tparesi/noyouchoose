json.extract! @plan, :id, :name

json.users @plan.users do |user|
  json.name user.name
  json.id user.id
end

json.restaurants @unswiped_restaurants.each do |potential_restaurant|
  restaurant = Restaurant.find(potential_restaurant.restaurant_id).yelp_data
  json.partial! 'api/restaurants/restaurant', restaurant: restaurant
end
