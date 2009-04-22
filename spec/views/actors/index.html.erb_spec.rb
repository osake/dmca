require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/actors/index.html.erb" do
  include ActorsHelper
  
  before(:each) do
    assigns[:actors] = [
      stub_model(Actor,
        :name => "value for name",
        :health => 1,
        :initiative => 1
      ),
      stub_model(Actor,
        :name => "value for name",
        :health => 1,
        :initiative => 1
      )
    ]
  end

  it "renders a list of actors" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

