class Match < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :plan
end
