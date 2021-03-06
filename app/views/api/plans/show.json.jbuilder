json.extract! @plan, :id, :name

json.users @plan.users do |user|
  next if user.id == current_user.id
  json.name user.name
  json.id user.id
end

json.restaurants @plan.unswiped_restaurants(current_user).each do |potential_restaurant|
  json.id potential_restaurant.restaurant_id
end

json.matches @plan.matches do |match|
  json.id match.restaurant_id
end
