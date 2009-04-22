require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Encounter do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :experience => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Encounter.create!(@valid_attributes)
  end
end
