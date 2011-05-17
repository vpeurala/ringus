require 'spec_helper'

describe Section do
  it "can be given a name" do
    s = Section.new :name => "Chorus"
    s.name.should == "Chorus" 
  end

  it "has default name if not given" do
    s = Section.new
    s.name.should == "Unnamed section"
  end
end
