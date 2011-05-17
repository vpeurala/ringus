module Singus
  class Section
    attr_reader :name

    def initialize(args = {})
      @name = args[:name] || "Unnamed section"
      @bars = args[:bars] || []
    end
  end
end
