class EnforceNonNullOnScore < ActiveRecord::Migration[5.1]
  def change
    reversible do |direction|
      direction.up do
        LeaderboardEntry.where(score: nil).update_all(score: 0)
      end
    end

    change_column :leaderboard_entries, :score, :integer, null: false, default: 0
  end
end
