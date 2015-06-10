json.extract! restaurant, :id, :name, :mobile_url, :image_url, :rating

json.address restaurant.location.display_address
