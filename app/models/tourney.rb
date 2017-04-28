class Tourney < ApplicationRecord
  belongs_to :user
  has_and_belong_to_many :teams
  has_many :requests
  has_many :matches
end
