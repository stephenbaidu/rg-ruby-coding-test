class AddUniquenessIndexToUsernameOnLeaderboardEntries < ActiveRecord::Migration[5.1]
  def change
    add_index :leaderboard_entries, [:username, :leaderboard_id], unique: true
  end
end
