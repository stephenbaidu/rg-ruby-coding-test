# == Schema Information
#
# Table name: leaderboard_entries
#
#  id             :integer          not null, primary key
#  score          :integer
#  username       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  leaderboard_id :integer
#
# Indexes
#
#  index_leaderboard_entries_on_leaderboard_id  (leaderboard_id)
#

require 'rails_helper'

RSpec.describe LeaderboardEntry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
