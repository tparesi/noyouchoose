json.partial! 'api/users/user', user: @user

json.plans @user.plans.each do |plan|
  json.id plan.id
  json.name plan.name
end
