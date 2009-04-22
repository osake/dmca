require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/encounters/new.html.erb" do
  include EncountersHelper
  
  before(:each) do
    assigns[:encounter] = stub_model(Encounter,
      :new_record? => true,
      :name => "value for name",
      :experience => 1
    )
  end

  it "renders new encounter form" do
    render
    
    response.should have_tag("form[action=?][method=post]", encounters_path) do
      with_tag("input#encounter_name[name=?]", "encounter[name]")
      with_tag("input#encounter_experience[name=?]", "encounter[experience]")
      # with_tag("input#encounter_actor_id[name=?]", "encounter[actor_id]")
    end
  end
end


