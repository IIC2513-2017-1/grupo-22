class Team < ApplicationRecord
  has_many :player, dependent: :destroy
  belongs_to :user

  has_and_belong_to_many :tourneys

  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'
end
