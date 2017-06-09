class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      #t.integer :team_id
      #t.integer :tourney_id
      t.belongs_to :team, :null => false, :index => true
      t.belongs_to :tourney, :null => false, :index => true
      t.integer :points

      t.timestamps
    end

    Tourney.find_each {|tourney|
      tourney.teams.each do |team|
        Participant.create!(tourney_id: tourney.id, team_id: team.id, points: 0 )
      end
    }
  end
end
