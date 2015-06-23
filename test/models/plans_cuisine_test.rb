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

require 'test_helper'

class PlansCuisineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
