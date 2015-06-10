json.extract! restaurant, :id, :name, :categories, :mobile_url, :image_url, :rating

json.categories restaurant.categories.map{ |c| c.first }
json.address restaurant.location.display_address
