json.array! @matches do |match|
  data = Restaurant.find(match.restaurant_id).yelp_data
  json.name data[:name]
  json.image_url = data[:image_url]
end
