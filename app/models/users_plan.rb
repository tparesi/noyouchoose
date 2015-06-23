# == Schema Information
#
# Table name: users_plans
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  plan_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersPlan < ActiveRecord::Base
  validates :user, :plan, presence: true

  belongs_to :user
  belongs_to :plan
end
