require 'spec_helper'

describe User do

end

describe "GET index" do
  describe "when user is not signed in" do
    it "should have a sign in link" do
      response.should have_selector('a', :content => 'sign in')
    end
    it "should have a sign up link" do
      response.should have_selector('a', :content => 'Sign up')
    end
  end

  describe "when user is signed in" do
    it "should have a sign out link" do
      pending
    end 
  end
end
