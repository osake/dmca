require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Actor do
  before(:each) do
    @encounter = mock_model(Encounter)
    @valid_attributes = {
      :name => "value for name",
      :health => 1,
      :initiative => 1,
      :encounter_id => @encounter_id
    }
  end

  it "should create a new instance given valid attributes" do
    Actor.create!(@valid_attributes)
  end
end
