# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider    :string
#  uid         :integer
#  name        :string
#  oauth_token :string
#
require "koala"

class User < ActiveRecord::Base
  has_many :users_plans
  has_many :plans, through: :users_plans
  has_many :sessions, dependent: :destroy
  has_many :swipe_rights, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id, dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    unless user
      user = User.create!(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid],
            name: auth_hash[:info][:name],
            oauth_token:  auth_hash[:credentials][:token])
    end

    user
  end

  def friends
    @graph = Koala::Facebook::API.new(oauth_token)
    friends = @graph.get_connections("me", "friends")
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
