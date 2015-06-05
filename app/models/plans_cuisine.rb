class PlansCuisine < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :plan
end
