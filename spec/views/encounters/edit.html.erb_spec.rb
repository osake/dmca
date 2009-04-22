require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/encounters/edit.html.erb" do
  include EncountersHelper
  
  before(:each) do
    assigns[:encounter] = @encounter = stub_model(Encounter,
      :new_record? => false,
      :name => "value for name",
      :experience => 1
    )
  end

  it "renders the edit encounter form" do
    render
    
    response.should have_tag("form[action=#{encounter_path(@encounter)}][method=post]") do
      with_tag('input#encounter_name[name=?]', "encounter[name]")
      with_tag('input#encounter_experience[name=?]', "encounter[experience]")
      # with_tag('input#encounter_actor_id[name=?]', "encounter[actor_id]")
    end
  end
end


