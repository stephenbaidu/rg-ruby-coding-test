require 'rails_helper'

RSpec.describe "Leaderboards", type: :request do
  describe "GET /leaderboards" do
    let!(:leaderboard_1) { create :leaderboard }
    let!(:leaderboard_2) { create :leaderboard }

    before do
      get leaderboards_path
    end

    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end

    it 'lists leaderboards' do
      expect(response.body).to include(leaderboard_1.name)
      expect(response.body).to include(leaderboard_2.name)
    end
  end
end
