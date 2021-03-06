module Singus
  class Note
    attr_accessor :tone, :pitch, :duration, :sound, :velocity

    def self.parse(dsl)
      n = Note.new
      d = dsl.split("-")
      n.tone = Tone.from_note_name(d[0]) || Tone.from_note_name("C4")
      n.duration = parse_duration(d[1]) || parse_duration("1/4")
      n.sound = d[2] || "Default"
      n.velocity = (d[3].nil? || d[3].strip.empty? || d[3].to_i == 0) ? 127 : d[3].to_i
      n
    end

    def self.parse_duration(input)
      return nil if input.nil? || input.strip.empty?
      fractions = input.split('/').map{|s| s.strip.to_f}
      return fractions[0] / fractions[1] if fractions.length > 1
      return fractions[0]
    end

    def ==(other)
      @tone == other.tone && @velocity == other.velocity && @sound == other.sound && @duration == other.duration
    end
  end
end

