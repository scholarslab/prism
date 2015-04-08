require 'spec_helper'

describe PagesController, :type => :controller do
  #render_views

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "sets the title" do
      get :index
      expect(assigns(:title)).to eq('Home')
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "sets the title" do
      get :about
      expect(assigns(:title)).to eq('About')
    end
  end

describe "GET 'alumni'" do
    it "returns http success" do
      get :alumni
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "sets the title" do
      get :alumni
      expect(assigns(:title)).to eq('Alumni')
    end
  end

  describe "GET 'terms'" do
    it "returns http success" do
      get :terms
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "sets the title" do
      get :terms
      expect(assigns(:title)).to eq('Terms of Service')
    end
  end

  describe "GET 'future'" do
    it "returns http success" do
      get :future
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "sets the title" do
      get :future
      expect(assigns(:title)).to eq('Future Directions')
    end
  end

  describe "GET 'demo'" do
    it "returns http success" do
      get :demo
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "sets the title" do
      get :demo
      expect(assigns(:title)).to eq('Demo')
    end
  end

  before(:each) do
    10.times do |populate|
      #Factory.create(:prism)
    end
  end

  # describe "when user is not signed in" do
  #   it "should have a sign in link" do
  #     visit '/index'
  #     expect(page).to match /users/sign_in
  #   end
  # end


  #describe "when user is signed in" do
    #before :each do 
      #@users = User.where(:email => "fred.foonly@example.com")
      #if @users.length == 0
        #@user = Factory(:user)
      #else
        #@user = @users[0]
      #end
      #visit '/users/sign_in'
      #fill_in 'user_email', :with => @user.email
      #fill_in 'user_password', :with => "my_password"#@user.password
      #click_button 'Sign in'
    #end
    #it "should have a sign out link" do
      #visit '/'
      #page.should have_selector('a', :text => 'Sign out')
    #end 
  #end

   #describe "when user is signed in" do
    #before :each do
      #@users = User.where(:email => "fred.foonly_noemail@example.com")
      #if @users.length == 0
        #@user =Factory(:user)
      #else
        #@user = @users[0]
      #end
      #visit '/users/sign_in'
      #fill_in 'user_email', :with => @user.email
      #fill_in 'user_password', :with => "my_password"#@user.password
      #click_button 'Sign in'
    #end 
    #it "should display the current user's email." do
        #visit '/'
        #page.should have_content (@user.email)
      #end
  #end
end

