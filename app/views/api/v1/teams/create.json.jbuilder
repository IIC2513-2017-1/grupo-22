json.team do
  json.id @team.id
  json.href api_v1_team_url(@team)
  json.name @team.name
  json.description @team.description
  json.trainer @team.trainer
  json.foundation_date @team.foundation_date
  json.logo @team.logo
  json.user_id @team.user_id
end
