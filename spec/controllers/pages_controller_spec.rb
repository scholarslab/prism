require 'spec_helper'
require 'factory_girl'

describe PagesController do
  include Devise::TestHelpers # to give your spec access to helpers
  render_views
  describe "GET 'index'" do
    it "returns http success" do
      visit 'index'
      response.should be_success
    end

    describe "when user is not signed in" do
      it "should have a sign in link" do
        visit 'index'
        page.should have_selector("a", :text => 'sign in')
      end
      it "should have a sign up link" do
        visit 'index'
        page.should have_selector('a', :text => 'Sign up')
      end
    end

    describe "when user is signed in" do
      it "should have a sign out link" do
        @user = Factory(:user)
        sign_in "jswaffor@gmail.com"
        visit 'index'
        within('#session') do
        page.should have_selector('a', :text => 'Sign out')
        end
      end 
    end
  end
end
