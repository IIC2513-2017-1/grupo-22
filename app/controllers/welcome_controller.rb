require 'Wunderground'

class WelcomeController < ApplicationController
  def index
  end

	def wunderground
	  @weather = Wunderground.get_weather
	  @prueba = HTTParty.get('http://api.wunderground.com/api/70f7130c809bd382/conditions/q/CA/San_Francisco.json')
	end

end
