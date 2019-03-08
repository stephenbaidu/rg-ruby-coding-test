class AddScoreService < ServiceBase
  def initialize(leaderboard, username, score)
    @leaderboard = leaderboard
    @username = username
    @score = score.to_i
  end

  def call
    score_entry.with_lock do
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
end
