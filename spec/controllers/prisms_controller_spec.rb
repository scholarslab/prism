require 'spec_helper'
require 'factory_girl'
require 'pp'

describe PrismsController do

  include Devise::TestHelpers
  render_views

  before(:each) do
    @prism = Factory.create(:prism)
    @user = sign_in Factory.create(:user)
  end

  describe "GET 'index'" do
    it "is successful" do

      get :index, :id => @prism.uuid
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
      response.should render_template('highlight')
    end
  end

  describe "GET 'highlight' when not authenticated" do
    it 'is not successful' do
      sign_out :user
      get :highlight, :id => @prism.uuid
      response.should_not be_success
    end
  end


  #describe "Get 'visualize'" do
  ##TODO write a factory for word_markings

  #it 'is successful' do
  #get :visualize, :id => @prism.uuid
  #response.should be_success
  #end

  #it "assigns @prism" do
  #get :visualize, :id => @prism.uuid
  #response.should_not be_nill
  #end

  #it "renders the 'visualize' template" do
  #get :highlight, :id => @prism.uuid
  #response.should render_template('visualize')
  #end

  #end

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

    it 'is not succesful when not authenticated' do
      get :new
      sign_out :user
      response.should_not be_redirect
    end
  end


  describe "POST 'create'" do

    context "The save is successful" do
      before(:each) do
        Prism.should_receive(:new).and_return(@prism)
        @prism.should_receive(:save).and_return(true)
      end

      it "redirects to the 'visualize' action" do
        post :create, :prism => @prism.attributes
        response.should redirect_to(visualize_path(@prism))
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

  describe "PUT 'update'" do

    context "the update is successful" do
      before(:each) do
        @prism.should_receive(:update_attributes).and_return(true)
        Prism.should_receive(:find).with(@prism.id).and_return(@prism)
      end

      it "redirects to 'show' action" do
        put :update, :id => @prism.uuid, :prism => {'title' => 'waynebot'} 
        response.should redirect_to(visualize_path(@prism))
      end

      it "sets a flash message" do
        put :update, :id => @prism.uuid, :prism => {'title' => 'waynebot'}
        flash[:notice].should == 'Prism was successfully updated.'
      end
    end

  end

  #describe "DELETE 'destroy'" do

    #it "should delete the prism" do
      #@prism.should_receive(:delete).and_return(true)
      #delete :destroy, :id => @prism.uuid
    #end

    #it "should redirect to index page" do
      #delete :destroy, :id => @prism.uuid
      #response.should redirect_to(:prisms)
    #end

    #it "sets a flash message" do
      #delete :destroy, :id => @prism.uuid
      #flash[:notice].should == 'Prism was successfully destroyed.'
    #end
  #end
end
