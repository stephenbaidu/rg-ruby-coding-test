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

require 'rails_helper'

RSpec.describe ScoreLog, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:leaderboard_entry) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0) }
  end
end
