module Singus
  class Section
    include DataMapper::Resource

    property :id, Serial
    is :list, :scope => :song_id

    attr_reader :name

    def initialize(args = {})
      @name = args[:name] || "Unnamed section"
      @bars = args[:bars] || []
    end
  end
end
