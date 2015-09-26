json.array! @restaurants do |restaurant|
  data = restaurant.yelp_data
  json.name data[:name]
  json.image_url = data[:image_url]
end
