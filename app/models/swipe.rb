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

class Swipe < ActiveRecord::Base
  validates :potential_restaurant_id, :user_id, :swipe_right?, presence: true

  belongs_to :potential_restaurant
  belongs_to :user
end
