class User < ActiveRecord::Base
  has_many :users_plans
  has_many :plans, through: :users_plans
  has_many :sessions, dependent: :destroy
  has_many :swipe_rights, dependent: :destroy

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    unless user
      user = User.create!(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid],
            name: auth_hash[:info][:name])
    end

    user
  end

  def unswiped_restaurants(plan)
    unswiped = []
    plan.potential_restaurants.each do |restaurant|

      swiped = restaurant.swipe_rights.where('user_id = ?', id).count > 0 ||
               restaurant.swipe_lefts.where('user_id = ?', id).count > 0

      unswiped << restaurant unless swiped
    end

    unswiped
  end

end
