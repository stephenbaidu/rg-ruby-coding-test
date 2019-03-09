require 'rails_helper'

RSpec.describe 'LeaderboardEntries', type: :request do
  describe 'GET /leaderboard_entries' do
    it 'works! (now write some real specs)' do
      get leaderboard_entries_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /leaderboard_entries/:id' do
    let!(:leaderboard) { create :leaderboard }
    let!(:leaderboard_entry) { create :leaderboard_entry, leaderboard: leaderboard, score: 12_345 }
    let!(:score_log_1) { create :score_log, leaderboard_entry: leaderboard_entry, score: 67_890 }
    let!(:score_log_2) { create :score_log, leaderboard_entry: leaderboard_entry, score: 10_101 }

    before do
      get leaderboard_entry_path(leaderboard_entry)
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'shows leaderboard entry details' do
      expect(response.body).to include(leaderboard_entry.username.to_s)
      expect(response.body).to include(leaderboard_entry.score.to_s)
    end

    it 'lists score logs' do
      expect(response.body).to include(score_log_1.score.to_s)
      expect(response.body).to include(score_log_2.score.to_s)
    end

    it 'shows Remove button' do
      expect(response.body).to include('Remove')
    end
  end
end
