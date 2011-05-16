module Singus
  class Note
    attr_accessor :note_name, :pitch, :duration, :sound, :velocity

    def self.parse(dsl)
      n = Note.new
      d = dsl.split("-")
      n.note_name = d[0]
      n.velocity = d[1].to_i
      n.sound = d[2]
      n.duration = parse_duration(d[3]) || 0.25
      n
    end

    def self.parse_duration(input)
      return nil if input.nil? || input.empty?
      fractions = input.split('/').map{|s| s.strip.to_f}
      return fractions[0] / fractions[1]
    end

    def ==(other)
      @note_name == other.note_name && @velocity == other.velocity && @sound == other.sound && @duration == other.duration
    end
  end
end

