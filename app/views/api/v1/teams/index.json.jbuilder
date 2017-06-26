# frozen_string_literal: true

json.array! @teams do |team|
  json.id team.id
  json.name team.name
  json.description team.description
  json.trainer team.trainer
  json.foundation_date team.foundation_date
  json.logo team.logo_file_name
  json.user_id team.user_id
end
