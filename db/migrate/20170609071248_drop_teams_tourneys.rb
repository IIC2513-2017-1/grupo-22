class DropTeamsTourneys < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams_tourneys
  end
end
