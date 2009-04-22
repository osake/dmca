require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/encounters/show.html.erb" do
  include EncountersHelper
  before(:each) do
    assigns[:encounter] = @encounter = stub_model(Encounter,
      :name => "value for name",
      :experience => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

