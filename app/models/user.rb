class User < ActiveRecord::Base
  validates :phone_number, :name, :password_digest, presence: true
  validates :phone_number, uniqueness: true

  has_many :users_plans
  has_many :plans, through: :users_plans
  has_many :sessions
end
