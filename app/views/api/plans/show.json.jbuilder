json.extract! @plan, :id, :name

json.users @plan.users do |user|
  json.name user.name
  json.id user.id
end

json.restaurants @plan.restaurants_yelp_data do |restaurant|
  json.partial! 'api/restaurants/restaurant', restaurant: restaurant
end
