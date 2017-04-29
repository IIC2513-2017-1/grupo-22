json.extract! tourney, :id, :name, :description, :format, :location, :inscription_limit_date, :start_date, :end_date, :created_at, :updated_at
json.url tourney_url(tourney, format: :json)
