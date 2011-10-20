require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
end
