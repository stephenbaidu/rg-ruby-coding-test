class AddScoreService < ServiceBase
  def initialize(leaderboard, username, score)
    @leaderboard = leaderboard
    @username = username
    @score = score.to_i
  end

  def call
    position_before_update # triggers caching of previous position on leaderboard
    update_score_entry

    position_before_update - position_after_update
  end

  private

  def position_before_update
    @position_before_update ||= ScorePositionService.call(@leaderboard, @username)
  end

  def score_entry
    @score_entry ||=
      @leaderboard.entries.find_or_create_by(username: @username) do |entry|
        entry.score = 0
      end
  end

  def update_score_entry
    score_entry.with_lock do
      create_score_log
      score_entry.score += @score
      score_entry.save!
      score_entry.reload
    end
  end

  def create_score_log
    ScoreLog.create!(leaderboard_entry: score_entry, score: @score)
  end

  def position_after_update
    ScorePositionService.call(@leaderboard, @username)
  end
end
