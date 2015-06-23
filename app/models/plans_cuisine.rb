# == Schema Information
#
# Table name: plans_cuisines
#
#  id         :integer          not null, primary key
#  plan_id    :integer          not null
#  cuisine_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlansCuisine < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :plan
end
