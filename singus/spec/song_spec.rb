require 'factory_girl'

describe "Song" do
  Factory.define(:song) do |song|
    song.name "Pekan laulu"
  end
  
  it "should have a name" do
    song = Factory.build(:song)
    song.name.should == "Pekan laulu"
  end

  it "should have a tempo"
  it "should have a meter"
  it "should have a key or be atonal"
  it "should have lyrics"
  it "should have length in bars"
  it "should have length in milliseconds"
end

