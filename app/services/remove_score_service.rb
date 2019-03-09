class RemoveScoreService < ServiceBase
  def initialize(score_log)
    @score_log = score_log
  end

  def call
    score_entry.with_lock do
      score_entry.score -= score
      @score_log.destroy!
      score_entry.save!
    end
  end

  private

  def score
    @score_log.score
  end

  def score_entry
    @score_entry ||= @score_log.leaderboard_entry
  end
end
