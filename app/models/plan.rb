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

  scope :upcoming_plans, -> { where(["time > ?", Time.now]).order(time: :desc) }
  scope :past_plans, -> { where(["time < ?", Time.now]).order(time: :desc) }
  scope :todays_plans, -> {where("time >= ? AND time < ?", Date.today, Date.tomorrow)}

  def most_agreed_upon_restaurant

  end

  def swiped(user)
    PotentialRestaurant.find_by_sql([
     "SELECT *
      FROM potential_restaurants
      JOIN swipes
      ON swipes.potential_restaurant_id = potential_restaurants.id
      WHERE potential_restaurants.plan_id = ?
      AND swipes.user_id = ?",
      self.id,
      user.id
    ])
  end

  def unswiped_restaurants(user)
    users_swipes = swiped(user)
    return potential_restaurants if users_swipes.map(&:id).empty?

    PotentialRestaurant.find_by_sql([
      "SELECT *
      FROM potential_restaurants
      WHERE potential_restaurants.plan_id = ?
      AND potential_restaurants.id <> ALL (ARRAY[?])",
      self.id,
      users_swipes.map(&:potential_restaurant_id)
    ]);
  end

end
