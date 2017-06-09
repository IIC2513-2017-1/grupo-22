class Participant < ApplicationRecord
  belongs_to :team
  belongs_to :tourney
end
