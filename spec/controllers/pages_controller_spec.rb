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
    it "should have a sign up link" do
      visit 'index'
      page.should have_selector('a', :text => 'Sign up')
    end
  end

  describe "when a user signs up with both email and nickname" do
    it "should populate login with both" do
      user = User.create(:email => "mary@mail.com", :nickname => "mary", :password => "mary_password")
      user.display_name.should eq("mary")
    end
  end

  describe "when a user signs up with an email but no nickname" do
    it "should populate login with both" do
      user = User.create(:email => "mary@mail.com", :password => "mary_password")
      user.display_name.should eq("mary@mail.com")
    end
  end

  describe "when a user signs up with a nickname but no email" do
    it "should populate login with the nickname" do
      user = User.create(:nickname => "mary", :password => "mary_password")   
      user.display_name.should eq("mary")
    end
  end

  # describe "when a user registers" do
  #   # before :each do 
  #   #   # @users = User.where(:email => "fred.foonly@example.com")
  #   #   # if @users.length == 0
  #   #   #   @user = Factory(:user)
  #   #   # else
  #   #   #   @user = @users[0]
  #   #   end
  #   it "should create a user" do
  #     visit '/users/sign_up'
  #     fill_in 'user_login', :with => "mary"#@user.email
  #     fill_in 'user_password', :with => "mary_password"#@user.password
  #     click_button 'Sign up'
  #     User.where(:login=>"mary").count.should_be 1
  #   # end
  #   end
  # end

  describe "when user is signed in" do
    before :each do 
      @users = User.where(:email => "fred.foonly@example.com")
      if @users.length == 0
        @user = Factory(:user)
      else
        @user = @users[0]
      end
      visit '/users/sign_in'
      fill_in 'user_login', :with => "fred"#@user.email
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
      @users = User.where(:nickname => "Fred w/o e-mail")
      if @users.length == 0
        @user =Factory(:emailless)
      else
        @user = @users[0]
      end
      visit '/users/sign_in'
      fill_in 'user_login', :with => "Fred w/o e-mail"#@user.email
      fill_in 'user_password', :with => "my_password"#@user.password
      click_button 'Sign in'
    end 
    it "should display the current user's e-mail if there is no nickname." do
      visit '/'
      if @user.nickname = nil
        page.should have_content (@user.email)
      end
    end
  end

   describe "when user is signed in" do
    before :each do
      @users = User.where(:email => "fred.foonly_noemail@example.com")
      if @users.length == 0
        @user =Factory(:nicknameless)
      else
        @user = @users[0]
      end
      visit '/users/sign_in'
      fill_in 'user_login', :with => "fred.foonly_noemail@example.com"#@user.email
      fill_in 'user_password', :with => "my_password"#@user.password
      click_button 'Sign in'
    end 
    it "should display the current user's nickname if there is one stored." do
      if @user.nickname != nil
        visit '/'
        page.should have_content (@user.nickname)
      end
    end
  end

  describe "when user signs up" do
    it "should require a login or an e-mail" do
      visit '/users/sign_up'
      fill_in 'user_password', :with => "my_password"
      fill_in 'user_password_confirmation', :with => "my_password"
      click_button 'Sign up'
      page.should have_content ('Email or nickname is required.')
    end
  end
end
