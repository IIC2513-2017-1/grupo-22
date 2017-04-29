class CreateTeamsTourneys < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_tourneys, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :tourney, index: true
    end
  end
end
