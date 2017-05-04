class Foro < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :tourney
  has_many :topics

end
