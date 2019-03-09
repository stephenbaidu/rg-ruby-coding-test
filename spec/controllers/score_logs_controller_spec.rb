require 'rails_helper'

RSpec.describe ScoreLogsController, type: :controller do
  let!(:leaderboard_entry) { create :leaderboard_entry }
  let!(:score_log) { create :score_log, leaderboard_entry: leaderboard_entry }
  let(:valid_session) { {} }
  let(:params) { {id: score_log.to_param, leaderboard_entry_id: leaderboard_entry.id} }

  describe 'DELETE #destroy' do
    it 'destroys the requested score_log' do
      expect do
        delete :destroy, params: params, session: valid_session
      end.to change(ScoreLog, :count).by(-1)
    end

    it 'redirects to the score_logs list' do
      delete :destroy, params: params, session: valid_session
      expect(response).to redirect_to(leaderboard_entry_url)
    end
  end
end
