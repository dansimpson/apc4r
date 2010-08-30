module Apc4r

  ##
  # Apc4r::Status is simple class for accessing power information from an APC UPS device
  # 
  # The running machine must have apcupsd installed and running for
  # this library to function
  #
  # = Example
  #   
  #   status = Apc4r::Status.new 60
  #   puts status.to_s 
  class Status

    ##
    # Creates a Status object, which gives access to information
    # related to the connected UPS device
    #
    # +cache_ttl+ is the number of seconds to cache status on an object
    # leave blank to fetch information from the ups device on every call
    def initialize cache_ttl=0
      @cache_ttl = cache_ttl
    end
  
    ##
    # fetches a hash of status information from the UPS device
    def status
      if @cache_ttl > 0
        if @cached_at == nil || @cached_at < (Time.now - @cache_ttl)
          @status = fetch_status
        end
      else
        @status = fetch_status
      end
      @status
    end
    
    ##
    # estimates the load, in watts, based on loadpct and nompower
    # This may not be even close to accurate
    def estimated_load
      (loadpct / 100) * nompower
    end

    ##
    # fetches a string represention of the UPS status
    def to_s
      result = ""
      status.each_pair do |k,v|
        result << "#{k} = #{v}\n"
      end
      result
    end
      
    def method_missing sym, *args
      if status.has_key?(sym)
        status[sym]
      else
        super
      end
    end
  
    private
  
    def fetch_status
      
      dump = `apcaccess`
      if dump =~ /Error/i
        raise "apcupsd is not running.  Please start apcupsd."
      end
      
      result = {}
      lines  = dump.split("\n")
      lines.each do |line|
        key, value = line.split(":").collect(&:strip)
        
        if value =~ /^([0-9]*[\.]?[0-9]+)\s/
          value = $1.to_f
        end
        
        result[key.gsub(" ","_").downcase.to_sym] = value
      end
      result
    end
    
  end
end
