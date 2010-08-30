#apc4r - A simple library for accessing power information from an APC UPS device

##Installation

	gem install apc4r -s http://gemcutter.org

## Examples

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

##Requirements

* An APC UPS Battery backup device connected to a ruby-enabled host
* apcupsd installed and running

##Dependencies
- Just apcupsd