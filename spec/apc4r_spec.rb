require "helper"

describe Apc4r do
  
  it "should have a version" do
    Apc4r.const_defined?("VERSION").should == true
  end
  
  it "should respond to print_status" do
    Apc4r.should respond_to :print_status
  end
  
end

