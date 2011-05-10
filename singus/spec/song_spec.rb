require 'spec_helper'

describe "Song" do
  Factory.define(:song) do |song|
    song.name "Pekan laulu"
    song.tempo 173
    song.meter "4/4"
    song.key "C major"
  end

  let(:song) { Factory.build(:song) }
  
  it "should have a name" do
    song.name.should == "Pekan laulu"
  end

  it "should have a tempo" do
    song.tempo.should == 173
  end

  it "should have a meter" do
    song.meter.should == "4/4"
  end

  it "should have a key" do
    song.key.should == "C major"
  end

  it "should have length in bars" do
    song.length_in_bars.should == 32
  end

  it "should have length in milliseconds" do
    song.length_in_milliseconds.should be_within(0.001).of(44393.063583815)
  end
end

