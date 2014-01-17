require 'open-uri'
require 'json'

#prompt user for location
puts "Enter an address, city, or zipcode:"
loc = gets.chomp

#remove white space and replace spaces with concats
loc.strip
loc.gsub!(" ","+")

#send request to google maps geoencode service and parse JSON response
data = open("http://maps.googleapis.com/maps/api/geocode/json?address="+loc+"&sensor=false").read
data = JSON.parse(data)

#output lat and long
puts "latitute:" + data['results'][0]['geometry']['location']["lat"].to_s
puts "longitute:" + data['results'][0]['geometry']['location']["lng"].to_s

