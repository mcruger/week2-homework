require 'open-uri'
require 'json'
#require 'pp'

#prompt user for starting location
puts "Please enter an address:"
loc = gets.chomp

#remove white space and replace spaces with concats
loc.strip
loc.gsub!(" ","+")

#send request to google api and parse JSON response
data = open("http://maps.googleapis.com/maps/api/geocode/json?address="+loc+"&sensor=false").read
data = JSON.parse(data)

#get lat and long 
lat = data['results'][0]['geometry']['location']["lat"].to_s
long = data['results'][0]['geometry']['location']["lng"].to_s

#call weather api
weather = open("http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+long+"&units=imperial").read
weather = JSON.parse(weather)

#pp weather

#output the temperature
puts weather['main']["temp"].to_s + "f"
