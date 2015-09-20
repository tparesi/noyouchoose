# == Schema Information
#
# Table name: matches
#
#  id            :integer          not null, primary key
#  restaurant_id :integer          not null
#  plan_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Match < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :plan

  def to_json(options)
    { id: id, restaurant_name: restaurant.yelp_data[:name], restaurant_img: restaurant.yelp_data[:image_url] }
  end
end
