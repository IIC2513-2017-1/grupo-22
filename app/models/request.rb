class Request < ApplicationRecord
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  belongs_to :team, foreign_key: 'id_team', class_name: 'Team'
  belongs_to :team
  belongs_to :tourney
end
