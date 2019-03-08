# == Schema Information
#
# Table name: leaderboard_entries
#
#  id             :integer          not null, primary key
#  score          :integer
#  username       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  leaderboard_id :integer
#
# Indexes
#
#  index_leaderboard_entries_on_leaderboard_id  (leaderboard_id)
#

FactoryBot.define do
  factory :leaderboard_entry do
    sequence(:username) { |n| "username.#{n}" }
    score { 0 }
    association :leaderboard, factory: :leaderboard
  end
end
