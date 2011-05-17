module Singus
  class Bar
    include Enumerable 

    attr_reader :meter

    def initialize(args = {})
      @meter = args[:meter] || "4/4"
      @notes = []
    end

    def empty?
      @notes.empty?
    end

    def <<(note)
      @notes << note
    end

    def each
      @notes.each do |note|
        yield note
      end
    end
  end
end
