# frozen_string_literal: true

json.array! @tourneys do |tourney|
  json.id tourney.id
  json.href api_v1_tourney_url(tourney)
  json.name tourney.name
  json.description tourney.description
  json.format tourney.format
  json.location tourney.location
  json.inscription_limit_date tourney.inscription_limit_date
  json.schedule tourney.schedule
  json.prize tourney.prize
  json.price tourney.price
  json.mail tourney.mail
end
