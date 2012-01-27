require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    describe "when user is not signed in" do
      it "should have a sign in link" do
        get 'index'
        response.should have_selector('a', :content => 'sign in')
      end
      it "should have a sign up link" do
        get 'index'
        response.should have_selector('a', :content => 'Sign up')
      end
    end

    describe "when user is signed in" do
      it "should have a sign out link" do
        pending
      end 
    end
  end
end
