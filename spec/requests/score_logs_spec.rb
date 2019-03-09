require 'rails_helper'

RSpec.describe 'ScoreLogs', type: :request do
  describe 'DELETE /leaderboard_entries/:leaderboard_entry_id/score_logs/:id' do
    let!(:leaderboard_entry) { create :leaderboard_entry, score: 200 }
    let!(:score_log) { create :score_log, leaderboard_entry: leaderboard_entry, score: 123 }

    before do
      delete leaderboard_entry_score_log_path(leaderboard_entry, score_log)
    end

    it 'redirects' do
      expect(response).to have_http_status(302)
    end

    it 'does not list deleted score log' do
      expect(response.body).not_to include(score_log.score.to_s)
    end
  end
end
