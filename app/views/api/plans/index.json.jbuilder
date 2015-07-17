json.plans do
  json.todays_plans @plans.todays_plans do |plan|
    json.name plan.name
    json.time plan.time
    # json.participants plan.participants
    # json.most_agreed_on_restaurant plan.most_agreed_on_restaurant
  end

  json.upcoming_plans @plans.upcoming_plans do |plan|
    json.name plan.name
    json.time plan.time
    # json.participants plan.participants
    # json.most_agreed_on_restaurant plan.most_agreed_on_restaurant
  end

  json.past_plans @plans.past_plans do |plan|
    json.name plan.name
    json.time plan.time
    # json.participants plan.participants
    # json.most_agreed_on_restaurant plan.most_agreed_on_restaurant
  end
end
