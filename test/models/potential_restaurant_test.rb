# == Schema Information
#
# Table name: potential_restaurants
#
#  id            :integer          not null, primary key
#  restaurant_id :integer          not null
#  plan_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PotentialRestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
