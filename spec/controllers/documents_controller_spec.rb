require 'spec_helper'

describe DocumentsController do

  include Devise::TestHelpers # to give your spec access to helpers
  render_views

  before(:each) do
    @doc = Document.create(title: 'test', author: 'test', description: 'test', pub_date: 1, format: 'text', content: 'test')
    @doc.save
  end

  describe "GET 'index'" do
    it "returns http success" do
      visit 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit 'show', @doc.id
      response.should be_success
    end
  end

end
