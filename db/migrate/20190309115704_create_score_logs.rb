class CreateScoreLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :score_logs do |t|
      t.references :leaderboard_entry, foreign_key: true, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
