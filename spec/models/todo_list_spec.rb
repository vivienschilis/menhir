require File.dirname(__FILE__) + '/../spec_helper'

describe TodoList do
  it "should be valid" do
    TodoList.new.should be_valid
  end
end
