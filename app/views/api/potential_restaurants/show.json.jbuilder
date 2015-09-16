json.restaurant do
  json.image_url @potential_restaurant.restaurant.yelp_data[:image_url]
  json.name @potential_restaurant.restaurant.yelp_data[:name]

end

json.user_swipes do
  json.array! @potential_restaurant.plan.users do |user|
    json.partial! 'api/users/user', user: user
    json.swiped_right @potential_restaurant.swipes.find_by(user_id: user.id).try(:swipe_right?)
  end
end
