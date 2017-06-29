# frozen_string_literal: true

json.team do
  json.id @team.id
  json.name @team.name
  json.description @team.description
  json.trainer @team.trainer
  json.foundation_date @team.foundation_date
  json.logo @team.logo_file_name
  json.players do
    json.array! @team.players do |player|
      json.id player.id
      json.name player.full_name
      json.position player.position
      json.email player.email
      json.address player.address
      json.phone player.phone
      json.birth_date player.birth_date
      json.occupation player.ocupation
      json.phote player.phote
      json.leg player.leg
    end
  end
end
