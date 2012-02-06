require 'spec_helper'

describe DocumentsController do

  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @doc = Factory(:document)
    end

    it "returns http success" do
      get 'show', :id => @doc
      response.should be_success
    end
  end

end
