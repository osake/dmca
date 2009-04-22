require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/actors/show.html.erb" do
  include ActorsHelper
  before(:each) do
    assigns[:actor] = @actor = stub_model(Actor,
      :name => "value for name",
      :health => 1,
      :initiative => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

