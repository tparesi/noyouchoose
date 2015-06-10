class User < ActiveRecord::Base
  has_many :users_plans
  has_many :plans, through: :users_plans
  has_many :sessions, dependent: :destroy

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    unless user
      user = User.create!(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid]
    end

    user
  end
end
