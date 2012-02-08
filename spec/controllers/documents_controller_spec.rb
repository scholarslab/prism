require 'spec_helper'

describe DocumentsController do

  include Devise::TestHelpers # to give your spec access to helpers
  render_views

  before(:each) do
    @doc = Factory(:document)
  end

  describe "GET 'index'" do 
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do #Tests that each document page will load
    it "returns http success" do
      get 'show', :id => @doc.id
      response.should be_success
    end
  end

end
