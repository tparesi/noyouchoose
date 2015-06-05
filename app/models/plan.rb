class Plan < ActiveRecord::Base
  validates :zipcode, :time, presence: true

  has_many :users_plans
  has_many :users, through: :users_plans
  has_many :plans_cuisines
  has_many :cuisines, through: :plans_cuisines
end
