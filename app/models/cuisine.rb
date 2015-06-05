class Cuisine < ActiveRecord::Base
  validates :title, presence: true
  has_many :plans_cuisines
  has_many :plans, through: :plans_cuisines
end
