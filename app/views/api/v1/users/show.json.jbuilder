# frozen_string_literal: true

json.user do
  json.id @user.id
  json.full_name @user.full_name
  json.username @user.username
  json.email @user.email
  json.avatar_file_name @user.avatar_file_name
  json.teams do
    json.array! @user.teams do |team|
      json.team_id team.id
      json.team_name team.name
    end
  end
  json.tourneys do
    json.array! @user.tourneys do |tourney|
      json.tourney_id tourney.id
      json.tourney_name tourney.name
      json.format tourney.format
    end
  end
end
