class CreateRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :rankings do |t|
      t.belongs_to :tourney, index:{ unique: true }
      t.integer :points
      t.timestamps

      t.references :team, foreign_key: true
    end
  end
end
