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

class LeaderboardEntry < ApplicationRecord
  belongs_to :leaderboard
  has_many   :score_logs

  validates :username, presence: true, uniqueness: { scope: :leaderboard_id, case_sensitive: false }
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
