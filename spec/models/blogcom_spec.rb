require File.dirname(__FILE__) + '/../spec_helper'

describe Blogcom do
  it "should be valid" do
    Blogcom.new.should be_valid
  end
end
