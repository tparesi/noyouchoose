json.todays_plans @plans.todays_plans, partial: 'plan', as: :plan
json.upcoming_plans @plans.upcoming_plans, partial: 'plan', as: :plan
json.past_plans @plans.past_plans.take(5), partial: 'plan', as: :plan
