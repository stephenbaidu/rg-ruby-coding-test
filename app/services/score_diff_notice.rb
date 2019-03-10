class ScoreDiffNotice < ServiceBase
  def initialize(action, score_diff)
    @action = action
    @score_diff = score_diff
  end

  def call
    if @action == :removed
      remove_notice_message
    else
      added_notice_message
    end
  end

  private

  def positive_diff?
    @score_diff > 0
  end

  def negative_diff?
    @score_diff < 0
  end

  def added_notice_message
    if positive_diff?
      "Score added, you went up by #{@score_diff}"
    elsif negative_diff?
      "Score added, you dropped by #{@score_diff.abs}"
    else
      'Score added, you have maintained your position'
    end
  end

  def remove_notice_message
    if positive_diff?
      "Score removed, you went up by #{@score_diff}"
    elsif negative_diff?
      "Score removed, you dropped by #{@score_diff.abs}"
    else
      'Score removed, you have maintained your position'
    end
  end
end
