class Team < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true, allow_blank: false

  has_many :players, dependent: :destroy
  belongs_to :user

  #has_and_belongs_to_many :tourneys, uniqueness: true
  has_many :participants
  has_many :tourneys, through: :participants

  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'

  #has_many :rankings
  has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "50x50#" }, :default_url => "/default/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
