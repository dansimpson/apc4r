require "helper"

describe Apc4r::Status do
  
  before do
    @status = Apc4r::Status.new 60
  end
  
  it "should have a load percentage" do
    @status.loadpct.should be_a_kind_of Float
  end

end