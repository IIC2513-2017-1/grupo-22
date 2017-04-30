class Tourney < ApplicationRecord
  validates :mail, presence: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  belongs_to :user
  has_and_belongs_to_many :teams
  has_many :requests
  has_many :matches
end
