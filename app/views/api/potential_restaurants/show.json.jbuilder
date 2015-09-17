json.restaurant do
  json.partial! 'api/restaurants/restaurant', restaurant: @potential_restaurant.restaurant.yelp_data
end

json.user_swipes do
  json.array! @potential_restaurant.plan.users do |user|
    json.partial! 'api/users/user', user: user
    json.swiped_right @potential_restaurant.swipes.find_by(user_id: user.id).try(:swipe_right?)
  end
end
