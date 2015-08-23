# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  time       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Plan < ActiveRecord::Base
  validates :time, :name, presence: true

  has_many :users_plans
  has_many :users, through: :users_plans
  has_many :plans_cuisines
  has_many :cuisines, through: :plans_cuisines
  has_many :potential_restaurants, inverse_of: :plan
  has_many :pending_restaurants, through: :potential_restaurants, source: :restaurant
  has_many :matches

  scope :upcoming_plans, lambda { where(["time > ?", Time.now]).order(time: :desc) }
  scope :past_plans, lambda { where(["time < ?", Time.now]).order("time DESC") }
  scope :todays_plans, lambda {where("time >= ? AND time < ?", Date.today, Date.tomorrow)}
end
