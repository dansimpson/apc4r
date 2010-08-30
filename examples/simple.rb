$:.unshift File.dirname(__FILE__) + "/../lib"

require "rubygems"
require "apc4r"

#create a new status class with a cache ttl of 60 seconds
status = Apc4r::Status.new 60

#print the load percentage
puts status.loadpct

#print the estimated load in watts
puts status.estimated_load

#print all available fields of the APC device
status.status.each_pair do |field, value|
  puts "#{field} -> #{value}"
end