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

require 'rails_helper'

RSpec.describe LeaderboardEntry, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:leaderboard) }
  end

  describe 'validations' do
    let(:subject) { create :leaderboard_entry }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:score) }
    it { should validate_uniqueness_of(:username).scoped_to(:leaderboard_id).case_insensitive }
  end
end
