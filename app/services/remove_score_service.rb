class RemoveScoreService < ServiceBase
  def initialize(score_log)
    @score_log = score_log
  end

  def call
    position_before_update # triggers caching of previous position on leaderboard
    update_score_entry

    position_before_update - position_after_update
  end

  private

  def score
    @score_log.score
  end

  def score_entry
    @score_entry ||= @score_log.leaderboard_entry
  end

  def leaderboard
    score_entry.leaderboard
  end

  def username
    score_entry.username
  end

  def position_before_update
    @position_before_update ||= ScorePositionService.call(leaderboard, username)
  end

  def update_score_entry
    score_entry.with_lock do
      score_entry.score -= score
      @score_log.destroy!
      score_entry.save!
    end
  end

  def position_after_update
    ScorePositionService.call(leaderboard, username)
  end
end
