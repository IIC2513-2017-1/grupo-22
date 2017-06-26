json.tourney do
  json.id @tourney.id
  json.name @tourney.name
  json.description @tourney.description
  json.format @torney.format
  json.location @tourney.location
  json.inscription_limit_date @tourney.inscription_limit_date
  json.start_date @tourney.start_date
  json.end_date @tourney.end_date
  json.schedule @tourney.schedule
  json.prize @tourney.prize
  json.price @tourney.price
  json.mail @tourney.mail
  json.phone @tourney.phone
  json.owner_id @tourney.user_id
end
