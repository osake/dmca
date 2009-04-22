require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActorsController do

  def mock_actor(stubs={})
    @mock_actor ||= mock_model(Actor, stubs)
  end
  
  describe "GET index" do
    it "assigns all actors as @actors" do
      Actor.should_receive(:find).with(:all).and_return([mock_actor])
      get :index
      assigns[:actors].should == [mock_actor]
    end
  end

  describe "GET show" do
    it "assigns the requested actor as @actor" do
      Actor.should_receive(:find).with("37").and_return(mock_actor)
      get :show, :id => "37"
      assigns[:actor].should equal(mock_actor)
    end
  end

  describe "GET new" do
    it "assigns a new actor as @actor" do
      Actor.should_receive(:new).and_return(mock_actor)
      get :new
      assigns[:actor].should equal(mock_actor)
    end
  end

  describe "GET edit" do
    it "assigns the requested actor as @actor" do
      Actor.should_receive(:find).with("37").and_return(mock_actor)
      get :edit, :id => "37"
      assigns[:actor].should equal(mock_actor)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created actor as @actor" do
        Actor.should_receive(:new).with({'these' => 'params'}).and_return(mock_actor(:save => true))
        post :create, :actor => {:these => 'params'}
        assigns[:actor].should equal(mock_actor)
      end

      it "redirects to the created actor" do
        Actor.stub!(:new).and_return(mock_actor(:save => true))
        post :create, :actor => {}
        response.should redirect_to(actor_url(mock_actor))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved actor as @actor" do
        Actor.stub!(:new).with({'these' => 'params'}).and_return(mock_actor(:save => false))
        post :create, :actor => {:these => 'params'}
        assigns[:actor].should equal(mock_actor)
      end

      it "re-renders the 'new' template" do
        Actor.stub!(:new).and_return(mock_actor(:save => false))
        post :create, :actor => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested actor" do
        Actor.should_receive(:find).with("37").and_return(mock_actor)
        mock_actor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :actor => {:these => 'params'}
      end

      it "assigns the requested actor as @actor" do
        Actor.stub!(:find).and_return(mock_actor(:update_attributes => true))
        put :update, :id => "1"
        assigns[:actor].should equal(mock_actor)
      end

      it "redirects to the actor" do
        Actor.stub!(:find).and_return(mock_actor(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(actor_url(mock_actor))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested actor" do
        Actor.should_receive(:find).with("37").and_return(mock_actor)
        mock_actor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :actor => {:these => 'params'}
      end

      it "assigns the actor as @actor" do
        Actor.stub!(:find).and_return(mock_actor(:update_attributes => false))
        put :update, :id => "1"
        assigns[:actor].should equal(mock_actor)
      end

      it "re-renders the 'edit' template" do
        Actor.stub!(:find).and_return(mock_actor(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested actor" do
      Actor.should_receive(:find).with("37").and_return(mock_actor)
      mock_actor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the actors list" do
      Actor.stub!(:find).and_return(mock_actor(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(actors_url)
    end
  end

end
