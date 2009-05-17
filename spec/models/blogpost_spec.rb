require File.dirname(__FILE__) + '/../spec_helper'

describe Blogpost do
  it "should be valid" do
    Blogpost.new.should be_valid
  end
end
