# == Schema Information
#
# Table name: swipe_lefts
#
#  id                      :integer          not null, primary key
#  user_id                 :integer          not null
#  potential_restaurant_id :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class SwipeLeft < ActiveRecord::Base
  validates :potential_restaurant_id, :user_id, presence: true

  belongs_to :potential_restaurant
  belongs_to :user
end
