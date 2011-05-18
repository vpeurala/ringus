module Singus
  class Meter
    include DataMapper::Resource

    property :id, Serial
    property :numerator, Integer
    property :denominator, Integer
  end
end
