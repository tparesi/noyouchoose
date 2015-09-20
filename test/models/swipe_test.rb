# == Schema Information
#
# Table name: swipes
#
#  id                      :integer          not null, primary key
#  user_id                 :integer          not null
#  potential_restaurant_id :integer          not null
#  swipe_right?            :boolean          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class SwipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
