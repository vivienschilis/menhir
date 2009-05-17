require File.dirname(__FILE__) + '/../spec_helper'

describe Shackmate do
  it "should be valid" do
    Shackmate.new.should be_valid
  end
end
