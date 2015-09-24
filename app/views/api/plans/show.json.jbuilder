json.extract! @plan, :id, :name

json.users @plan.users do |user|
  next if user.id == current_user.id
  json.name user.name
  json.id user.id
end

json.restaurants @plan.unswiped_restaurants(current_user).each do |potential_restaurant|
  json.id potential_restaurant.restaurant.id
end

# json.restaurants @plan.potential_restaurants.each do |potential_restaurant|
#   swiped = potential_restaurant.swipes.find_by(user_id: current_user.id)
#   json.id potential_restaurant.restaurant.id unless swiped
# end
