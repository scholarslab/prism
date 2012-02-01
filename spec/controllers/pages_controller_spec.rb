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
        page.should have_selector("form", :action => '/users/sign_in')
      end
      it "should have a sign up link" do
        visit 'index'
        page.should have_selector('a', :text => 'Sign up')
      end
    end

    describe "when user is signed in" do
      before :each do 
        @users = User.where(:email => "fred.foonly@example.com")
        if @users.length == 0
          @user = Factory(:user)
        else
          @user = @users[0]
        end
        visit 'index'
        fill_in 'user_email', :with => "fred.foonly@example.com"#@user.email
        fill_in 'user_password', :with => "my_password"#@user.password
        click_button 'Sign in'
      end
      it "should have a sign out link" do
        visit '/'
        page.should have_selector('a', :text => 'Sign out')
      end 
    end
  end
end
