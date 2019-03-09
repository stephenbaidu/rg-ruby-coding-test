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

require 'rails_helper'

RSpec.describe LeaderboardEntry, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:leaderboard) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:score) }
  end
end
