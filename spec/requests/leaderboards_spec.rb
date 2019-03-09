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

  describe "GET /leaderboards/:id" do
    let!(:leaderboard) { create :leaderboard }
    let!(:leaderboard_entry_1) { create :leaderboard_entry, leaderboard: leaderboard }
    let!(:leaderboard_entry_2) { create :leaderboard_entry, leaderboard: leaderboard }

    before do
      get leaderboard_path(leaderboard)
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'lists leaderboard entries' do
      expect(response.body).to include(leaderboard_entry_1.username)
      expect(response.body).to include(leaderboard_entry_2.username)
    end
  end
end
