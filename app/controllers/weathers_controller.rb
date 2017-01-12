require 'rubygems'
require 'httparty'
require 'json'

class WeathersController < ApplicationController

	
	def welcome

		# API call
		@response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=Bangalore&appid=532d313d6a9ec4ea93eb89696983e369')

		# Weather Data
		@weather_data = JSON.parse(@response.body)

			# New data entry on Page load
	      	w = Weather.new
	      	w.temperature = @weather_data['main']['temp']
	      	w.currenttime = Time.now.strftime("%I:%M")
	      	w.currentdate = Time.now.to_date
	      	w.save

	      	# Array of today's temperature
	      	@temperatures = Weather.where(currentdate: Time.now.to_date).pluck(:temperature)
	      	
	      	# Fining Min and Max Temperature
	      	@maxtemp = @temperatures.max
	      	@mintemp = @temperatures.min
	      	

	end
end
