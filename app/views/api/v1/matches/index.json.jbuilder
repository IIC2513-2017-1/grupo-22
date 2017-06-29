# frozen_string_literal: true

json.array! @matches do |match|
  json.id match.id
  json.href api_v1_match_url(match)
  json.date match.date
  json.tourney match.tourney.name
  json.home_team match.home_team.name
  json.away_team match.away_team.name
end
