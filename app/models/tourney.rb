class Tourney < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :teams
  has_many :requests
  has_many :matches
end
