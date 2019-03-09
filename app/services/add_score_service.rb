class AddScoreService < ServiceBase
  def initialize(leaderboard, username, score)
    @leaderboard = leaderboard
    @username = username
    @score = score.to_i
  end

  def call
    score_entry.with_lock do
      create_score_log
      score_entry.score += @score
      score_entry.save!
      score_entry.reload
    end
  end

  private

  def score_entry
    @score_entry ||=
      @leaderboard.entries.find_or_create_by(username: @username) do |entry|
        entry.score = 0
      end
  end

  def create_score_log
    ScoreLog.create!(leaderboard_entry: score_entry, score: @score)
  end
end
