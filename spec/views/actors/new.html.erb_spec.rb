require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/actors/new.html.erb" do
  include ActorsHelper
  
  before(:each) do
    assigns[:actor] = stub_model(Actor,
      :new_record? => true,
      :name => "value for name",
      :health => 1,
      :initiative => 1
    )
  end

  it "renders new actor form" do
    render
    
    response.should have_tag("form[action=?][method=post]", actors_path) do
      with_tag("input#actor_name[name=?]", "actor[name]")
      with_tag("input#actor_health[name=?]", "actor[health]")
      with_tag("input#actor_initiative[name=?]", "actor[initiative]")
    end
  end
end


