# == Schema Information
#
# Table name: score_logs
#
#  id                   :integer          not null, primary key
#  score                :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  leaderboard_entry_id :integer          not null
#
# Indexes
#
#  index_score_logs_on_leaderboard_entry_id  (leaderboard_entry_id)
#

FactoryBot.define do
  factory :score_log do
    association :leaderboard_entry, factory: :leaderboard_entry
    score { 1 }
  end
end
