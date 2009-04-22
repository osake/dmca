require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EncountersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "encounters", :action => "index").should == "/encounters"
    end
  
    it "maps #new" do
      route_for(:controller => "encounters", :action => "new").should == "/encounters/new"
    end
  
    it "maps #show" do
      route_for(:controller => "encounters", :action => "show", :id => "1").should == "/encounters/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "encounters", :action => "edit", :id => "1").should == "/encounters/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "encounters", :action => "create").should == {:path => "/encounters", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "encounters", :action => "update", :id => "1").should == {:path =>"/encounters/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "encounters", :action => "destroy", :id => "1").should == {:path =>"/encounters/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/encounters").should == {:controller => "encounters", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/encounters/new").should == {:controller => "encounters", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/encounters").should == {:controller => "encounters", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/encounters/1").should == {:controller => "encounters", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/encounters/1/edit").should == {:controller => "encounters", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/encounters/1").should == {:controller => "encounters", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/encounters/1").should == {:controller => "encounters", :action => "destroy", :id => "1"}
    end
  end
end
