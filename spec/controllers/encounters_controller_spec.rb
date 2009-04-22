require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EncountersController do

  def mock_encounter(stubs={})
    @mock_encounter ||= mock_model(Encounter, stubs)
  end
  
  describe "GET index" do
    it "assigns all encounters as @encounters" do
      Encounter.should_receive(:find).with(:all).and_return([mock_encounter])
      get :index
      assigns[:encounters].should == [mock_encounter]
    end
  end

  describe "GET show" do
    it "assigns the requested encounter as @encounter" do
      Encounter.should_receive(:find).with("37").and_return(mock_encounter)
      get :show, :id => "37"
      assigns[:encounter].should equal(mock_encounter)
    end
  end

  describe "GET new" do
    it "assigns a new encounter as @encounter" do
      Encounter.should_receive(:new).and_return(mock_encounter)
      get :new
      assigns[:encounter].should equal(mock_encounter)
    end
  end

  describe "GET edit" do
    it "assigns the requested encounter as @encounter" do
      Encounter.should_receive(:find).with("37").and_return(mock_encounter)
      get :edit, :id => "37"
      assigns[:encounter].should equal(mock_encounter)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created encounter as @encounter" do
        Encounter.should_receive(:new).with({'these' => 'params'}).and_return(mock_encounter(:save => true))
        post :create, :encounter => {:these => 'params'}
        assigns[:encounter].should equal(mock_encounter)
      end

      it "redirects to the created encounter" do
        Encounter.stub!(:new).and_return(mock_encounter(:save => true))
        post :create, :encounter => {}
        response.should redirect_to(encounter_url(mock_encounter))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved encounter as @encounter" do
        Encounter.stub!(:new).with({'these' => 'params'}).and_return(mock_encounter(:save => false))
        post :create, :encounter => {:these => 'params'}
        assigns[:encounter].should equal(mock_encounter)
      end

      it "re-renders the 'new' template" do
        Encounter.stub!(:new).and_return(mock_encounter(:save => false))
        post :create, :encounter => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested encounter" do
        Encounter.should_receive(:find).with("37").and_return(mock_encounter)
        mock_encounter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :encounter => {:these => 'params'}
      end

      it "assigns the requested encounter as @encounter" do
        Encounter.stub!(:find).and_return(mock_encounter(:update_attributes => true))
        put :update, :id => "1"
        assigns[:encounter].should equal(mock_encounter)
      end

      it "redirects to the encounter" do
        Encounter.stub!(:find).and_return(mock_encounter(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(encounter_url(mock_encounter))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested encounter" do
        Encounter.should_receive(:find).with("37").and_return(mock_encounter)
        mock_encounter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :encounter => {:these => 'params'}
      end

      it "assigns the encounter as @encounter" do
        Encounter.stub!(:find).and_return(mock_encounter(:update_attributes => false))
        put :update, :id => "1"
        assigns[:encounter].should equal(mock_encounter)
      end

      it "re-renders the 'edit' template" do
        Encounter.stub!(:find).and_return(mock_encounter(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested encounter" do
      Encounter.should_receive(:find).with("37").and_return(mock_encounter)
      mock_encounter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the encounters list" do
      Encounter.stub!(:find).and_return(mock_encounter(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(encounters_url)
    end
  end

end
