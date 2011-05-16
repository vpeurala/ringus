require 'spec_helper'

describe "Rhythm" do
  Factory.define(:rhythm) do |r|
    r.accent_pattern "1111"
    r.density 1
    r.bars 1
  end

  let(:rhythm) { Factory.build(:rhythm) }
  
  it "should be created" do
    rhythm.should_not be_nil 
  end
end

