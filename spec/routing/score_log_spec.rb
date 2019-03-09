require 'rails_helper'

RSpec.describe ScoreLogsController, type: :routing do
  describe 'routing' do
    it 'routes to #destroy' do
      expect(delete: '/leaderboard_entries/1/score_logs/1').to route_to(
        'score_logs#destroy', id: '1', leaderboard_entry_id: '1'
      )
    end
  end
end
