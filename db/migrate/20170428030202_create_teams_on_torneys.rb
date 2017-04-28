class CreateTeamsOnTorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_on_torneys do |t|
      t.belongs_to :team, index: true
      t.belongs_to :tourney, index: true
      t.timestamps
    end
  end
end
