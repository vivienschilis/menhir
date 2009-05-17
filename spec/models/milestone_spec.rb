require File.dirname(__FILE__) + '/../spec_helper'

describe Milestone do
  it "should be valid" do
    Milestone.new.should be_valid
  end
end
