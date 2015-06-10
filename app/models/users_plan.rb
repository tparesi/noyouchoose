class UsersPlan < ActiveRecord::Base
  validates :user, :plan, presence: true

  belongs_to :user
  belongs_to :plan
end
