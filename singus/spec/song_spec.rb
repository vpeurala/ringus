describe "Song" do
  Factory.define(:song) do |song|
    song.name "Pekan laulu"
    song.tempo 173
  end

  let(:song) { Factory.build(:song) }
  
  it "should have a name" do
    song.name.should == "Pekan laulu"
  end

  it "should have a tempo" do
    song.tempo.should == 173
  end

  it "should have a meter"
  it "should have a key or be atonal"
  it "should have lyrics"
  it "should have length in bars"
  it "should have length in milliseconds"
end

