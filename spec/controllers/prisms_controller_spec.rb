require 'spec_helper'
require 'factory_girl'

describe PrismsController do

  include Devise::TestHelpers
  render_views

  before(:each) do
    @prism = Factory.create(:prism)
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      response.should be_success
    end

    it "assigns @prism" do
      get :index
      assigns(:prisms).should_not be_nil
    end

    it "renders index template" do
      get :index
      response.should render_template('index')
    end
  end

  describe "Get 'visualize'" do
    it 'is successful' do
      get :visualize, :id => @prism.uuid
      response.should be_success
    end

    it "assigns @prism" do
      get :visualize, :id => @prism.uuid
      response.should_not be_nill
    end

    it "renders the 'visualize' template" do
      get :highlight, :id => @prism.uuid
      response.should render_template('visualize')
    end

  end

  describe "GET 'highlight'" do

    it 'is successful' do
      get :highlight, :id => @prism.uuid
      response.should be_success
    end

    it "assigns @prism" do
      get :highlight, :id => @prism.uuid
      assigns(:prism).should_not be_nil
    end

    it "renders the 'highlight' template" do
      get :highlight, :id => @prism.uuid
      response.should render_template('show')
    end
  end



  describe "GET 'new'" do
    it 'is successful' do
      get :new
      response.should be_success
    end

    it "assigns @prism" do
      get :new
      assigns(:prism).should_not be_nil
    end

    it "renders the 'new' template" do
      get :new
      response.should render_template('new')
    end
  end


  describe "POST 'create'" do
    before(:each) do
      @prism = Prism.new
      @prism.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        Prism.should_receive(:new).and_return(@prism)
        @prism.should_receive(:save).and_return(true)
      end

      it "redirects to the 'show' action" do
        post :create, :prism => @prism.attributes
        response.should redirect_to(prism_path(@prism)) # Put the right show path here
      end

      it "sets a flash message" do
        post :create, :prism => @prism.attributes
        flash[:notice].should == 'Prism was successfully created.'
      end
    end

    context "the save fails" do
      before(:each) do
        @prism.should_receive(:save).and_return(false)
        Prism.should_receive(:new).and_return(@prism)
      end

      it "renders the 'new' action" do
        post :create, :prism => @prism.attributes
        response.should render_template(:new)
      end

      it "assigns @prism" do
        post :create, :prism => @prism.attributes
        assigns(:prism).should_not be_nil
      end
    end
  end  
  describe "GET 'edit'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @prism = prisms(:one)
    end

    it 'is successful' do
      get :edit, :id => @prism.id
      response.should be_success
    end

    it "assigns @prism" do
      get :edit, :id => @prism.id
      assigns(:prism).should_not be_nil
    end

    it "renders the 'edit' template" do
      get :edit, :id => @prism.id
      response.should render_template('edit')
    end
  end  
  describe "PUT 'update'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @prism = prisms(:one)
    end

    context "the update is successful" do
      before(:each) do
        @prism.should_receive(:update_attributes).and_return(true)
        Prism.should_receive(:find).with(@prism.id).and_return(@prism)
      end

      it "redirects to 'show' action" do
        put :update, :id => @prism.id, :prism => {} # Add here some attributes for the model
        response.should redirect_to(prism_path(@prism)) # Put the right show path here
      end

      it "sets a flash message" do
        put :update, :id => @prism.id, :prism => {} # Add here some attributes for the model
        flash[:notice].should == 'Prism was successfully updated.' # Your flash message here
      end
    end

    context "the update fails" do
      before(:each) do
        @prism.should_receive(:update_attributes).and_return(false)
        Prism.should_receive(:find).with(@prism.id).and_return(@prism)
      end

      it "renders the 'edit' action" do
        put :update, :id => @prism.id, :prism => {} # Add here some attributes for the model
        response.should render_template(:edit)
      end

      it "assigns @prism" do
        put :update, :id => @prism.id, :prism => {} # Add here some attributes for the model
        assigns(:prism).should_not be_nil
      end
    end
  end  
  describe "DELETE 'destroy'" do
    before(:each) do
      # Replace this with your Mock Factory, for ex: Machinist, Fabrication...
      @prism = prisms(:one)
      Prism.should_receive(:find).with(@prism.id).and_return(@prism)
    end

    it "should delete the prism" do
      @prism.should_receive(:delete).and_return(true)
      delete :destroy, :id => @prism.id
    end

    it "should redirect to index page" do
      delete :destroy, :id => @prism.id
      response.should redirect_to(:prisms)
    end

    it "sets a flash message" do
      delete :destroy, :id => @prism.id
      flash[:notice].should == 'Prism was successfully destroyed.' # Your flash message here
    end
  end
end
