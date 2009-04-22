require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/encounters/index.html.erb" do
  include EncountersHelper
  
  before(:each) do
    assigns[:encounters] = [
      stub_model(Encounter,
        :name => "value for name",
        :experience => 1
      ),
      stub_model(Encounter,
        :name => "value for name",
        :experience => 1
      )
    ]
  end

  it "renders a list of encounters" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

