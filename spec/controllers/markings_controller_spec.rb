require 'spec_helper'

describe MarkingsController do

  include Devise::TestHelpers

  render_views

  before :each do
    sign_in Factory.create(:user)
    @marking  = Factory.create(:marking)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :document_id => @marking.document.id
      response.should be_success
    end

  end

end
