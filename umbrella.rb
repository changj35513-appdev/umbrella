p "Where are you located?"

 user_location = gets.chomp

# p user_location = "200 S Wacker"
require "json"
require "open-uri"
# get user_location
gmaps_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

# full_url = https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY
# subbed_string = full_url.gsub("UIC", user_location)

raw_gmaps_data = URI.open(gmaps_api_url).read

parsed_gmaps_data = JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")

first_result = results_array.at(0)

bounds_array = first_result.fetch("geometry")

location_result = bounds_array.fetch("location")

latitude = location_result.fetch("lat")
longitude = location_result.fetch("lng")
location_result

# DarkSky

darksky_api_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{latitude},#{longitude}"

raw_darksky_data = URI.open(darksky_api_url).read

parsed_darksky_data = JSON.parse(raw_darksky_data)
# p darksky_api_url

current_hash = parsed_darksky_data.fetch("currently")

current_temperature = current_hash.fetch("temperature")

p "The temperature in #{user_location.capitalize} is #{current_temperature}°F"
