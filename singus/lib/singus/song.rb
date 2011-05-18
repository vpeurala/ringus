module Singus
  class Song
    include DataMapper::Resource

    property :id, Serial
    property :name, String, :required => true
    property :default_tempo, Integer, :default => 120
    has 1, :default_meter, 'Meter'
    has n, :sections

    attr_accessor :name, :tempo, :meter, :key

    def length_in_bars
      # TODO VP
      32
    end

    def length_in_milliseconds
      # TODO VP Magic 4, assumes 4/4 meter
      one_beat_in_milliseconds * length_in_bars * 4
    end

    private
    def one_beat_in_milliseconds
      60000.0 / tempo
    end
  end
end

