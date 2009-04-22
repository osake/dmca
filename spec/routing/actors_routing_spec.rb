require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActorsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "actors", :action => "index").should == "/actors"
    end
  
    it "maps #new" do
      route_for(:controller => "actors", :action => "new").should == "/actors/new"
    end
  
    it "maps #show" do
      route_for(:controller => "actors", :action => "show", :id => "1").should == "/actors/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "actors", :action => "edit", :id => "1").should == "/actors/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "actors", :action => "create").should == {:path => "/actors", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "actors", :action => "update", :id => "1").should == {:path =>"/actors/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "actors", :action => "destroy", :id => "1").should == {:path =>"/actors/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/actors").should == {:controller => "actors", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/actors/new").should == {:controller => "actors", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/actors").should == {:controller => "actors", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/actors/1").should == {:controller => "actors", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/actors/1/edit").should == {:controller => "actors", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/actors/1").should == {:controller => "actors", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/actors/1").should == {:controller => "actors", :action => "destroy", :id => "1"}
    end
  end
end
