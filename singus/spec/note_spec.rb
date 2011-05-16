require 'spec_helper.rb'

describe Note do
  Factory.define :note do |n|
    n.velocity 122
    n.note_name "Db5"
    n.duration 1/16.0
    n.sound "Horn"
  end

  def note 
    Factory.build :note
  end
	
  it "always should have velocity" do
    note.velocity.should_not be_nil
  end

  it "always should have note name" do
    note.note_name.should_not be_nil
  end

  it "always should have duration" do
    note.duration.should_not be_nil
  end
  
  it "always should have sound" do
    note.sound.should_not be_nil
  end

  it "should be parsable from string with only note name" do
    note = Note.parse "D4"
    note.note_name.should == "D4"
  end
	
  it "should be parsable from string with note name and duration" do
    Note.parse("D4-1").duration.should == 1.0
    Note.parse("D4-1/8").duration.should == 1/8.0
    Note.parse("D4-1/8-Piano-122").duration.should == 1/8.0
  end

  it "should be parsable from string with note name, velocity and sound" do
    note = Note.parse "D4-1/8-Piano"
    note.sound.should == "Piano"
  end

  it "should be parsable from string with note name, velocity, sound and duration" do
  end
	
  it "should have sensible defaults" do
    Note.parse("Db5-1/16-Horn-122").should == note
    Note.parse("Db5-1/16-Horn").duration.should == 1/16.0
    Note.parse("Db5-1/16").sound.should == "Default"
    Note.parse("Db5").velocity.should == 127
  end

  it "can be a rest" do
    Note.parse("REST").note_name.should == "REST"
    Note.parse("REST").duration.should == 1/4.0
    Note.parse("REST-1/16").duration.should == 1/16.0
  end
end
