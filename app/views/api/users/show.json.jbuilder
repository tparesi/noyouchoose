json.extract! @user, :id, :uid, :name

json.plans @user.plans.each do |plan|
  json.id plan.id
  json.name plan.name
end
