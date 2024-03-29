class Team < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true, allow_blank: false

  has_many :players, dependent: :destroy
  belongs_to :user

  has_many :participants
  has_many :tourneys, through: :participants

  has_many :home_matches, foreign_key: 'home_team_id', class_name: 'Match'
  has_many :away_matches, foreign_key: 'away_team_id', class_name: 'Match'

  has_attached_file :logo, :storage => :cloudinary,:styles => { :medium => "200x200>", :thumb => "30x30#" }, :default_public_id => ':style/missing',:default_url => "/default/:style/missing.png", :path => ':id/:style/:filename'
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    where("LOWER(name) LIKE ?", "%#{search.downcase}%")
  end
end
