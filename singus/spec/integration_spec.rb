require 'spec_helper'

describe "Integration tests" do
  DataMapper.auto_migrate!

  it "can save and load songs" do
    Song.create
    puts Song.all
  end
end
