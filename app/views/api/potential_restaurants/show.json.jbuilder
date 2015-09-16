json.restaurant_img @potential_restaurant.restaurant.yelp_data[:image_url]

json.users do
  json.array! @potential_restaurant.plan.users do |user|
    json.partial! 'api/users/user', user: user
    json.swiped_right @potential_restaurant.swipes.find_by(user_id: user.id).try(:swipe_right?)
  end
end
