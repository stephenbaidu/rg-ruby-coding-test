class ScoreLogsController < ApplicationController
  before_action :set_leaderboard_entry
  before_action :set_score_log, only: [:destroy]

  # DELETE /leaderboard_entries/1/score_logs/1
  def destroy
    RemoveScoreService.call(@score_log)
    redirect_to @leaderboard_entry, notice: 'Score was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leaderboard_entry
    @leaderboard_entry = LeaderboardEntry.find(params[:leaderboard_entry_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_score_log
    @score_log = ScoreLog.find(params[:id])
  end
end
