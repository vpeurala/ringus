require 'singus/version'

require 'spec_helper'

describe Singus do
  it "should have a VERSION constant" do
    Singus.const_defined?('VERSION').should == true
  end
end
