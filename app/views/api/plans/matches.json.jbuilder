json.array! @restaurants do |restaurant|
  json.name restaurant[:name]
  json.image_url = restaurant[:image_url]
end
