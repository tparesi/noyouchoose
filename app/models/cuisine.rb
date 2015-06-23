# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ActiveRecord::Base
  validates :title, presence: true
  has_many :plans_cuisines
  has_many :plans, through: :plans_cuisines
end
