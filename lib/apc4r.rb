module Apc4r

  VERSION = 0.1

  ##
  # print the status of the UPS device
  def self.print_status
    puts Status.new
  end

end

require "apc4r/status"