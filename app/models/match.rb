class Match < ApplicationRecord

  scope :played_by, -> (team){ where('(home_team_id = :team_id OR away_team_id = :team_id) AND played = true' , team_id: team.id) }
  scope :won_by, -> (team){ where('winner = ?' , team.name) }
  scope :lost_by, -> (team){ where("((home_team_id = :team_id AND winner != :team_name) OR (away_team_id = :team_id AND winner != :team_name)) AND winner != 'draw'" , team_id: team.id, team_name: team.name) }
  scope :draws, -> (team){ where("(winner = 'draw') AND (home_team_id = :team_id OR away_team_id = :team_id)", team_id: team.id) }


  validates :date, presence: true
  validate :not_same_team, :check_matches_of_team, :check_date, on: :create


  belongs_to :tourney
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'
  has_many :requests

  def not_same_team
    errors.add(:base, "Can not play against itself") unless home_team_id != away_team_id
  end

  def check_matches_of_team
    matches_home = Team.find(home_team_id).home_matches.pluck(:date)+Team.find(home_team_id).away_matches.pluck(:date)
    if matches_home.include?(date)
      errors.add(:base, "#{home_team.name} already has match that day")
    end

    matches_away = Team.find(away_team_id).home_matches.pluck(:date)+Team.find(away_team_id).away_matches.pluck(:date)
    if matches_away.include?(date)
      errors.add(:base, "#{away_team.name} already has match that day")
    end

  end

  def check_date
    tourney = Tourney.find(tourney_id)
    errors.add(:base, "Out of range Date") unless (tourney.start_date <= date && tourney.end_date >= date)
  end
end
