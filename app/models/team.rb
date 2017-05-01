class Team < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true, allow_blank: false
  validates :logo, presence: true, allow_blank: false 
  validates :trainer, presence: true, allow_blank: false
    
  has_many :players, dependent: :destroy
  belongs_to :user

  has_and_belongs_to_many :tourneys

  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'
end
