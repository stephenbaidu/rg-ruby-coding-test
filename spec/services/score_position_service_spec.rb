require 'rails_helper'

RSpec.describe ScorePositionService do
  let!(:leaderboard) { create :leaderboard }
  let!(:leaderboard_entry_1) { create :leaderboard_entry, leaderboard: leaderboard, score: 10 }
  let!(:leaderboard_entry_2) { create :leaderboard_entry, leaderboard: leaderboard, score: 15 }
  let!(:leaderboard_entry_3) { create :leaderboard_entry, leaderboard: leaderboard, score: 10 }
  let!(:leaderboard_entry_4) { create :leaderboard_entry, leaderboard: leaderboard, score: 5 }
  let(:username) { '' }
  let(:service) { ScorePositionService.new(leaderboard, username) }

  describe 'when entry is topmost score' do
    let(:username) { leaderboard_entry_2.username }

    it 'returns 1 as current position' do
      expect(service.call).to eq(1)
    end
  end

  describe 'when entry is a tie score' do
    let(:username) { leaderboard_entry_3.username }

    it 'returns 2 as current position' do
      expect(service.call).to eq(2)
    end
  end

  describe 'when entry is last score' do
    let(:username) { leaderboard_entry_4.username }

    it 'returns 2 as current position' do
      expect(service.call).to eq(4)
    end
  end
end
