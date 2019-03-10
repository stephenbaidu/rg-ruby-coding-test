class ScorePositionService < ServiceBase
  def initialize(leaderboard, username)
    @leaderboard = leaderboard
    @username = username
    @position = 1
  end

  def call
    return @position if username_is_topmost?

    sorted_score_entry.each_cons(2).with_index do |(previous, current), index|
      if current.score < previous.score
        @position = index + 2
      end
      break if current.username == @username
    end

    @position
  end

  private

  def sorted_score_entry
    @leaderboard.entries.reorder(score: :desc)
  end

  def topmost_entry
    sorted_score_entry.first
  end

  def username_is_topmost?
    topmost_entry.present? && topmost_entry.username == @username
  end
end
