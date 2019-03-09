# == Schema Information
#
# Table name: leaderboard_entries
#
#  id             :integer          not null, primary key
#  score          :integer          default(0), not null
#  username       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  leaderboard_id :integer
#
# Indexes
#
#  index_leaderboard_entries_on_leaderboard_id               (leaderboard_id)
#  index_leaderboard_entries_on_username_and_leaderboard_id  (username,leaderboard_id) UNIQUE
#

FactoryBot.define do
  factory :leaderboard_entry do
    sequence(:username) { |n| "username.#{n}" }
    score { 0 }
    association :leaderboard, factory: :leaderboard
  end
end
