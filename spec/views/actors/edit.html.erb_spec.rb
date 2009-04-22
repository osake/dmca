require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/actors/edit.html.erb" do
  include ActorsHelper
  
  before(:each) do
    assigns[:actor] = @actor = stub_model(Actor,
      :new_record? => false,
      :name => "value for name",
      :health => 1,
      :initiative => 1
    )
  end

  it "renders the edit actor form" do
    render
    
    response.should have_tag("form[action=#{actor_path(@actor)}][method=post]") do
      with_tag('input#actor_name[name=?]', "actor[name]")
      with_tag('input#actor_health[name=?]', "actor[health]")
      with_tag('input#actor_initiative[name=?]', "actor[initiative]")
    end
  end
end


