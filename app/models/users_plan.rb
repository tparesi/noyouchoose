class UsersPlan < ActiveRecord::Base
  validates :user_id, :plan_id, presence: true

  belongs_to :user
  belongs_to :plan
end
