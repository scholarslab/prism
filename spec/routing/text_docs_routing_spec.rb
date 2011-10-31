require "spec_helper"

describe TextDocsController do
  describe "routing" do

    it "routes to #index" do
      get("/text_docs").should route_to("text_docs#index")
    end

    it "routes to #new" do
      get("/text_docs/new").should route_to("text_docs#new")
    end

    it "routes to #show" do
      get("/text_docs/1").should route_to("text_docs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/text_docs/1/edit").should route_to("text_docs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/text_docs").should route_to("text_docs#create")
    end

    it "routes to #update" do
      put("/text_docs/1").should route_to("text_docs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/text_docs/1").should route_to("text_docs#destroy", :id => "1")
    end

  end
end
