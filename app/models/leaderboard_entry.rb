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

class LeaderboardEntry < ApplicationRecord
  belongs_to :leaderboard

  validates :username, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
