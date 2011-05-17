module Singus
  class Tone
    attr_reader :pitch

    NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    REFERENCE_PITCH = 440.0
    REFERENCE_PITCH_MIDI_VALUE = 69

    def self.pitch_to_midi_value(pitch)
      (REFERENCE_PITCH_MIDI_VALUE + NOTE_NAMES.length * Math.log(pitch.to_f / REFERENCE_PITCH, 2)).round.to_i
    end

    def self.midi_value_to_pitch(midi_value)
      REFERENCE_PITCH * (2 ** ((midi_value - REFERENCE_PITCH_MIDI_VALUE) / NOTE_NAMES.length.to_f)).to_f
    end

    def self.note_name_to_midi_value(note_name)
      return 0 if note_name =~ /rest/i
      match_result = note_name.match(/([CDEFGAB])(#|b)?([0-9])|REST/)
      note_name = match_result[1]
      sharp_or_flat = case match_result[2] when "#" then 1 when "b" then -1 else 0 end
      octave = match_result[3].to_i
      NOTE_NAMES.length * (octave + 1) + NOTE_NAMES.index(note_name) + sharp_or_flat
    end
   
    def initialize(pitch)
      @pitch = pitch
    end

    def midi_value 
      (69 + 12 * Math.log2(pitch / REFERENCE_PITCH)).round
    end

    def note_name
      note_name = NOTE_NAMES[midi_value % 12]
      octave = (midi_value / 12) - 1
      "#{note_name}#{octave}"
    end
 
    def self.from_pitch(pitch)
      return Rest.new if pitch == 0
      return Tone.new(pitch)
    end
 
    def self.from_note_name(note_name)
      return Rest.new if note_name =~ /rest/i
      return Tone.new(midi_value_to_pitch(note_name_to_midi_value(note_name)))
    end

    def self.from_midi_value(midi_value)
      return Rest.new if midi_value == 0
      return Tone.new(midi_value_to_pitch(midi_value))
    end

    def up(steps = 1)
      Tone.from_midi_value(self.midi_value + steps)
    end

    def down(steps = 1)
      Tone.from_midi_value(self.midi_value - steps)
    end

    def ==(other)
      @pitch == other.pitch
    end

    def rest?
      false
    end
  end

  class Rest < Tone
    def initialize
      @pitch = 0
    end

    def rest?
      true
    end

    def midi_value
      0
    end

    def note_name
      "REST"
    end
  end
end

module Math
  def self.log2(number)
    log(number) / log(2)
  end
end
