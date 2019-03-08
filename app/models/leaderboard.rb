# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Leaderboard < ApplicationRecord
  has_many :entries, class_name: 'LeaderboardEntry'
end
