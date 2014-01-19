require 'open-uri'
require 'json'
require 'pp'

#prompt user for starting location
puts "Enter an origin address:"
origin = gets.chomp

#prompt user for ending location
puts "Enter a destination address:"
dest = gets.chomp

#remove white space and replace spaces with concats
origin.strip
origin.gsub!(" ","+")
dest.strip
dest.gsub!(" ","+")

#send request to google api and parse JSON response
data = open("http://maps.googleapis.com/maps/api/directions/json?origin="+origin+"&destination="+dest+"&sensor=false").read
data = JSON.parse(data)

#pp data['routes'][0]['legs'][0]["duration"]
#pp data['routes'][0]['legs'][0]["distance"]

#output distance and duration
puts "Total driving time: " + data['routes'][0]['legs'][0]["duration"]["text"].to_s
puts "Total distance traveled " + data['routes'][0]['legs'][0]["distance"]["text"].to_s
