class Match < ApplicationRecord
  #include CheckTeam
  #validate :search_home_team
  #validate :search_away_team
  validates :date, presence: true
  validate :check_matches_of_team
  validate :check_date

  belongs_to :tourney
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'
  has_many :requests

  def check_matches_of_team
    matches_home = Team.find(home_team_id).home_matches.pluck(:date)+Team.find(home_team_id).away_matches.pluck(:date)
    if matches_home.include?(date)
      errors.add(:home_team_id, "Equipo home ya tiene un partido ese día")
    end

    matches_away = Team.find(away_team_id).home_matches.pluck(:date)+Team.find(away_team_id).away_matches.pluck(:date)

    if matches_away.include?(date)
      errors.add(:away_team_id, "Equipo away ya tiene un partido ese día")
    end
  end

  def check_date
    tourney = Tourney.find(tourney_id)
    errors.add(:id, "Fecha está fuera del periodo del torneo") unless (tourney.start_date <= date and tourney.end_date >= date)
  end
end
