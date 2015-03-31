require 'spec_helper'
require 'factory_girl'
require 'pp'

describe PrismsController, :type => :controller do

  include Devise::TestHelpers
  #render_views

  before(:each) do
    @prism = Factory.create(:prism)
    @user = sign_in Factory.create(:user)
  end

  describe "GET 'index'" do
    #it "is successful" do

      #get :index, :id => @prism.uuid
      #expect(response).to be_success
      #expect(response).to have_http_status(200)
    #end

    #it "assigns @prism" do
      #get :index
      #expect(assigns(:prisms)).to_not be_nil
    #end

    #it "renders index template" do
      #get :index
      #expect(response).to render_template('index')
    #end
  end
end

  #describe "GET 'highlight'" do

    #it 'is successful' do
      #get :highlight, :id => @prism.uuid
      #response.should be_success
    #end

    #it "assigns @prism" do
      #get :highlight, :id => @prism.uuid
      #assigns(:prism).should_not be_nil
    #end

    #it "renders the 'highlight' template" do
      #get :highlight, :id => @prism.uuid
      #response.should render_template('highlight')
    #end
  #end

  #describe "GET 'highlight' when not authenticated" do
    #it 'is not successful' do
      #sign_out :user
      #get :highlight, :id => @prism.uuid
      #response.should_not be_success
    #end
  #end

  #describe "POST 'highlight'" do
    #before :each do
      #Facet.create :description => "Facet 0",
                   #:prism_id    => @prism.id,
                   #:order       => 0,
                   #:color       => "Red"
      #Facet.create :description => "Facet 1",
                   #:prism_id    => @prism.id,
                   #:order       => 1,
                   #:color       => "Blue"
      #@prism.add_content_spans
      #@prism.save

      #@n = 1000
      #@indexes = JSON.generate(Array(1..@n))
    #end

    #it "should take time and do something" do
      #t1 = Time.now
      #post :highlight_post, :id => @prism.uuid, :facet0_indices => @indexes,
        #:facet1_indices => @indexes
      #t2 = Time.now
      #puts ">>> POST highlight (#{@n}) elapsed: #{t2 - t1}"

      #max_markings = [@prism.num_words, @n].min
      #WordMarking.count.should eq(@prism.facets.count * max_markings)
    #end

    #it "should not allow invalid indexes" do
      #post :highlight_post, :id => @prism.uuid, :facet0_indices => @indexes,
        #:facet1_indices => @indexes

      #WordMarking.all.map { |wm| wm.index } .max.should eq(@prism.num_words)
    #end

    #it "should not allow duplicate indexes" do
      #max_markings = [@prism.num_words, @n].min

      #post :highlight_post, :id => @prism.uuid, :facet0_indices => @indexes,
        #:facet1_indices => []
      #WordMarking.count.should eq(max_markings)
      #WordMarking.all.map { |m| m.index } .keep_if { |i| i == 10 } .should eq([10])

      #post :highlight_post, :id => @prism.uuid, :facet0_indices => @indexes,
        #:facet1_indices => []
      #WordMarking.count.should eq(max_markings)
      #WordMarking.all.map { |m| m.index } .keep_if { |i| i == 10 } .should eq([10])
    #end
  #end


  #describe "Get 'visualize'" do

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

  # end

  #describe "GET 'new'" do
    #it 'is successful' do
      #get :new
      #response.should be_success
    #end

    #it "assigns @prism" do
      #get :new
      #assigns(:prism).should_not be_nil
    #end

    #it "renders the 'new' template" do
      #get :new
      #response.should render_template('new')
    #end

    #it 'is not succesful when not authenticated' do
      #get :new
      #sign_out :user
      #response.should_not be_redirect
    #end
  #end

  #describe "POST 'create'" do

    #context "The save is successful for a not-unlisted prism" do
      #before(:each) do
        #Prism.should_receive(:new).and_return(@prism)
        #@prism.should_receive(:save).and_return(true)
      #end

      #it "redirects to the 'highlight' action" do
        #post :create, :prism => @prism.attributes
        #response.should redirect_to(highlight_path(@prism))
      #end

      #it "sets a flash message" do
        #post :create, :prism => @prism.attributes
        #flash[:notice].should == 'Prism was successfully created.'
      #end
    #end

     #context "The save is successful for an unlisted prism" do
      #before(:each) do
        #@unl_prism = Factory.create(:prism, unlisted:true)
        #Prism.should_receive(:new).and_return(@unl_prism)
        #@unl_prism.should_receive(:save).and_return(true)
      #end

      #it "redirects to the 'highlight' action" do
        #post :create, :prism => @unl_prism.attributes
        #response.should redirect_to(highlight_path(@unl_prism))
      #end

      #it "sets a flash message" do
        #post :create, :prism => @unl_prism.attributes
        #flash[:notice].should == 'Success! Keep in mind that this prism will not show up in the public browse page. Be sure to copy the link to send to your friends!'
      #end
    #end

    #context "the save fails" do
      #before(:each) do
        #@prism.should_receive(:save).and_return(false)
        #Prism.should_receive(:new).and_return(@prism)
      #end

      #it "renders the 'new' action" do
        #post :create, :prism => @prism.attributes
        #response.should render_template(:new)
      #end

      #it "assigns @prism" do
        #post :create, :prism => @prism.attributes
        #assigns(:prism).should_not be_nil
      #end
    #end
  #end
#
  # describe "PUT 'update'" do
#
    # context "the update is successful" do
      # before(:each) do
        # @prism.should_receive(:update_attributes).and_return(true)
        # Prism.should_receive(:find).with(@prism.id).and_return(@prism)
      # end
#
      # it "redirects to 'show' action" do
        # put :update, :id => @prism.uuid, :prism => {'title' => 'waynebot'}
        # response.should redirect_to(visualize_path(@prism))
      # end
#
      # it "sets a flash message" do
        # put :update, :id => @prism.uuid, :prism => {'title' => 'waynebot'}
        # flash[:notice].should == 'Prism was successfully updated.'
      # end
    # end
#
  # end

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
#end
