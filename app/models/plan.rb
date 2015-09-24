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

  # def unswiped_restaurants(user)
  #   unswiped = []
  #   potential_restaurants.each do |restaurant|
  #     swiped = restaurant.swipes.find_by(user_id: user.id)
  #     unswiped << restaurant unless swiped
  #   end
  #
  #   unswiped
  # end

  def unswiped_restaurants(user)
    not_current_users = PotentialRestaurant.find_by_sql([
     "SELECT *
      FROM potential_restaurants
      JOIN restaurants
      ON potential_restaurants.restaurant_id = restaurants.id
      LEFT JOIN swipes
      ON swipes.potential_restaurant_id = potential_restaurants.id
      WHERE potential_restaurants.plan_id = ?
      AND swipes.user_id IS NULL OR swipes.user_id != ?",
      self.id,
      user.id
    ]);

    current_users = PotentialRestaurant.find_by_sql([
     "SELECT *
      FROM potential_restaurants
      JOIN restaurants
      ON potential_restaurants.restaurant_id = restaurants.id
      LEFT JOIN swipes
      ON swipes.potential_restaurant_id = potential_restaurants.id
      WHERE potential_restaurants.plan_id = ?
      AND swipes.user_id = ?",
      self.id,
      user.id
    ]);
    
    current_user_swiped_restaurant_ids = current_users.map(&:restaurant_id)
    not_current_users.select do |potential_restaurant|
      !current_user_swiped_restaurant_ids.include? potential_restaurant.restaurant_id
    end
  end

end
