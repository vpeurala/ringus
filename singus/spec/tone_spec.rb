require 'spec_helper'

describe Tone do
  it "can be created with a pitch" do
    Tone.from_pitch(440).should_not be_nil
  end

  it "can be created with a note name" do
    Tone.from_note_name("C4").should_not be_nil
  end

  it "can be created with a midi value" do
    Tone.from_midi_value(69).should_not be_nil
  end

  it "knows its pitch" do
    Tone.from_note_name("C4").pitch.should == 261.6255653005986
  end

  it "knows its name" do
    Tone.from_pitch(440).note_name.should == "A4"
  end

  it "knows its midi value" do
    Tone.from_pitch(440).midi_value.should == 69
  end

  it "can be raised" do
    original_note = Tone.from_pitch(440)
    raised_note = original_note.up
    raised_note.midi_value.should == 70
    raised_note.pitch.should == 466.1637615180899
  end

  it "can be lowered" do
    original_note = Tone.from_pitch(440)
    lowered_note = original_note.down
    lowered_note.midi_value.should == 68
    lowered_note.pitch.should == 415.3046975799451
  end

  it "can be lowered two times" do
    original_note = Tone.from_pitch(440)
    lowered_note = original_note.down.down
    lowered_note.midi_value.should == 67
    lowered_note.pitch.should == 391.99543598174927 
  end

  it "can be raised a minor sixth" do
    original_note = Tone.from_pitch(440)
    raised_note = original_note.up(8)
    raised_note.pitch.should == 698.4564628660078
    raised_note.note_name.should == "F5"
  end

  it "can be lowered an octave" do
    original_note = Tone.from_pitch(440)
    lowered_note = original_note.down(12)
    lowered_note.pitch.should == 220
  end

  it "can be lowered a major third" do
    original_note = Tone.from_pitch(440)
    lowered_note = original_note.down(4)
    lowered_note.pitch.should == 349.2282314330039
    lowered_note.midi_value.should == 65
  end

  describe "note name parsing" do
    it "supports sharps and flats" do
      Tone.from_note_name("C4").midi_value.should == 60
      Tone.from_note_name("C#4").midi_value.should == 61
      Tone.from_note_name("Cb4").midi_value.should == 59
    end

    it "supports octaves" do
      Tone.from_note_name("C4").midi_value.should == 60
      Tone.from_note_name("C3").midi_value.should == 48
      Tone.from_note_name("C5").midi_value.should == 72
    end
  end

  it "is not a rest if note name, pitch or midi value given" do
    Tone.from_note_name("C0").should_not be_rest
    Tone.from_pitch(1).should_not be_rest
    Tone.from_midi_value(1).should_not be_rest
  end

  describe Rest do
    it "can be created from parsing" do
      Tone.from_note_name("REST").should be_rest
      Tone.from_note_name("Rest").should be_rest
      Tone.from_note_name("rest").should be_rest
    end

    it "can be created from pitch 0" do
      Tone.from_pitch(0).should be_rest
    end

    it "can be created from midi value 0" do
      Tone.from_midi_value(0).should be_rest
    end
  end
end

