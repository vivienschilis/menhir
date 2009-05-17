require File.dirname(__FILE__) + '/../spec_helper'

describe Image do
  it "should be valid" do
    Image.new.should be_valid
  end
end
