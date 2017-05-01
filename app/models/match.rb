class Match < ApplicationRecord
  include CheckTeam
  validate :search_home_team
  validte :search_away_team

  belongs_to :tourney
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'
  has_many :requests

end
