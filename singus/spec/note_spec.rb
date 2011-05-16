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
	
  it "should be parsable from string with note name and velocity" do
    note = Note.parse "D4-100"
    note.velocity.should == 100
  end

  it "should be parsable from string with note name, velocity and sound" do
    note = Note.parse "D4-100-Piano"
    note.sound.should == "Piano"
  end

  it "should be parsable from string with note name, velocity, sound and duration" do
    note = Note.parse "D4-100-Piano-1/8"
    note.duration.should == 1/8.0
  end
	
  it "should be parsable from string with any combination of the above in any order" do
    Note.parse("Db5-122-Horn-1/16").should == note
    Note.parse("Db5-122-Horn").duration.should == 1/4.0
    Note.parse("Db5-122").sound.should == "Default"
    Note.parse("Db5").velocity.should == 127
  end

  it "should not require strict formatting in obvious cases"

  it "should have the previous sound used if no explicit sound given"
  it "should have the previous duration used if no explicit duration given"
  it "should have the previous velocity used if no explicit velocity given"
  it "should have the previous note name if no explicit note name given"
end
