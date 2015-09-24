json.extract! restaurant, :id, :name, :categories, :mobile_url, :rating, :image_url
json.categories restaurant[:categories].map{ |c| c.first }
json.address restaurant[:location].display_address
