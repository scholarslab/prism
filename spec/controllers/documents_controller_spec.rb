require 'spec_helper'

describe DocumentsController do
  include Devise::TestHelpers # to give your spec access to helpers
  render_views
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
