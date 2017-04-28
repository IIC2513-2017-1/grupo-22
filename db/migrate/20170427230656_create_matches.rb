class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer 'home_team_id', null: false
      t.integer 'away_team_id', null: false
      t.date :date

      t.timestamps

      t.belongs_to :tourney, index: true
    end

    add_index :matches, :home_team_id
    add_index :matches, :away_team_id
    add_index :matches, [:home_team_id, :away_team_id]
  end
end
