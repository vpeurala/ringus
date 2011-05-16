require 'spec_helper.rb'

describe Note do
  it "always should have velocity"
  it "always should have note name"
  it "always should have duration"
  it "always should have sound"
  it "should have the previous sound used if no explicit sound given"
  it "should have the previous duration used if no explicit duration given"
  it "should have the previous velocity used if no explicit velocity given"
  it "should have the previous note name if no explicit note name given"
  it "should be parsable from string with only note name"
  it "should be parsable from string with note name and velocity"
  it "should be parsable from string with note name, velocity and sound"
  it "should be parsable from string with note name, velocity, sound and duration"
  it "should be parsable from string with any combination of the above in any order"
  it "should not require strict formatting in obvious cases"
end
