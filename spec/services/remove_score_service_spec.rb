require 'rails_helper'

RSpec.describe RemoveScoreService do
  let!(:leaderboard_entry) { create :leaderboard_entry, score: 20 }
  let!(:score_log) { create :score_log, leaderboard_entry: leaderboard_entry, score: 10 }
  let(:service) { RemoveScoreService.new(score_log) }

  describe '#call' do
    it 'reduces the score by deleted score_log.score' do
      expect { service.call }.to change { leaderboard_entry.reload.score }.by(score_log.score * -1)
    end

    it 'deletes the score_log record' do
      expect { service.call }.to change { ScoreLog.count }.by(-1)
    end
  end
end
