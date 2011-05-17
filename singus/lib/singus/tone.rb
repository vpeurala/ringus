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
      match_result = note_name.match(/([CDEFGAB])(#|b)?([0-9])/)
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
      Tone.new(pitch)
    end
 
    def self.from_note_name(note_name)
      Tone.new(midi_value_to_pitch(note_name_to_midi_value(note_name)))
    end

    def self.from_midi_value(midi_value)
      Tone.new(midi_value_to_pitch(midi_value))
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
  end
end

module Math
  def self.log2(number)
    log(number) / log(2)
  end
end
