# == Schema Information
#
# Table name: users_plans
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  plan_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UsersPlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
