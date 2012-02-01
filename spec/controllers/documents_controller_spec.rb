require 'spec_helper'

describe DocumentsController do

  include Devise::TestHelpers # to give your spec access to helpers
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      visit 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit '3'
      response.should be_success
    end
  end

end
