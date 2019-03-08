require 'rails_helper'

RSpec.describe AddScoreService do
  let(:leaderboard) { create :leaderboard }
  let(:username) { 'user.name' }
  let(:score) { 10 }
  let(:service) { AddScoreService.new(leaderboard, username, score) }

  describe 'when username exists with a score' do
    let!(:entry) { create :leaderboard_entry, leaderboard: leaderboard, username: username, score: 10 }

    it 'increases the score' do
      expect { service.call }.to change { entry.reload.score }.by(score)
    end
  end

  describe 'when username does not exist' do
    before { LeaderboardEntry.delete_all }

    it 'creates entry and updates score to score' do
      service.call
      expect(LeaderboardEntry.first.score).to eq(score)
    end
  end
end
