require 'spec_helper'
require 'factory_girl'

describe PagesController do
  include Devise::TestHelpers # to give your spec access to helpers
  render_views

  before(:each) do
    10.times do |populate|
      Factory.create(:document)
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "when user is not signed in" do
    it "should have a sign in link" do
      visit 'index'
      page.should have_selector("a", :href => '/users/sign_in')
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
      visit '/users/sign_in'
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => "my_password"#@user.password
      click_button 'Sign in'
    end
    it "should have a sign out link" do
      visit '/'
      page.should have_selector('a', :text => 'Sign out')
    end 
  end

   describe "when user is signed in" do
    before :each do
      @users = User.where(:email => "fred.foonly_noemail@example.com")
      if @users.length == 0
        @user =Factory(:user)
      else
        @user = @users[0]
      end
      visit '/users/sign_in'
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => "my_password"#@user.password
      click_button 'Sign in'
    end 
    it "should display the current user's email." do
        visit '/'
        page.should have_content (@user.email)
      end
  end
end

