# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :leaderboard do
    sequence(:name) { |n| "Leaderboard #{n}" }
  end
end
