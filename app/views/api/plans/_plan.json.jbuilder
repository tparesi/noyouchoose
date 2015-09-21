json.extract! plan, :id, :name, :time
json.participants plan.users.reject { |u| u == current_user }
# json.most_agreed_on_restaurant plan.most_agreed_on_restaurant
