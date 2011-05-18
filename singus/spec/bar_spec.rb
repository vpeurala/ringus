require 'spec_helper'

describe Bar do
  describe "newly created" do
    before :each do
      @bar = Bar.new
    end

    it "exists" do
      @bar.should_not be_nil
    end

    it "is empty" do
      @bar.should be_empty
    end

    it "has default meter if none given" do
      @bar.meter.should == "4/4"
    end

    it "has given meter if given" do
      @bar = Bar.new :meter => "7/8"
      @bar.meter.should == "7/8" 
    end

    it "can be added notes to" do
      @bar << Note.parse("D#4")
      @bar.each do |note|
        note.should == Note.parse("D#4")
      end
    end

    it "complains if more notes added than the bar can take"
  end
end
