require 'httparty'

class Wunderground
  include HTTParty
  format :json

  base_uri 'api.wunderground.com'

  attr_accessor :icon, :ciudad, :temp, :relative_humidity, :icon_wu_url

  def initialize(response)
    @icon = response['current_observation']['icon']
    @ciudad = response['current_observation']['display_location']['full']
    @temp = response['current_observation']['temp_c']
  end

  def self.get_weather(city)
    response = get("/api/70f7130c809bd382/conditions/q/Chile/#{city}.json")
    if response.success?
      new(response)
    else
      raise response.response
    end
  end

end