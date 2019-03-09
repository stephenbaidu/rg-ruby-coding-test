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

class ScoreLog < ApplicationRecord
  belongs_to :leaderboard_entry

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
