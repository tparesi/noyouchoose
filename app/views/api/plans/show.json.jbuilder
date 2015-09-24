json.extract! @plan, :id, :name

json.users @plan.users do |user|
  next if user.id == current_user.id
  json.name user.name
  json.id user.id
end

json.restaurants @unswiped_restaurants.each do |potential_restaurant|
  json.id potential_restaurant.restaurant.id
end
