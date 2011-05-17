require 'spec_helper'

describe Bar do
  describe "newly created" do
    before :each do
      @bar = Bar.new
    end

    it "exists" do
      @bar.should_not be_nil
    end

    it "is empty" do
      @bar.should be_empty
    end

    it "has meter"
  end
end
