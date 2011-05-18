require 'rubygems'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, {:adapter => "yaml", :path => "db"})

require 'singus/version'
require 'singus/song'
require 'singus/rhythm'
require 'singus/tone'
require 'singus/note'
require 'singus/bar'
require 'singus/section'

DataMapper.finalize

