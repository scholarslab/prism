require "spec_helper"

describe TextsController do
  describe "routing" do

    it "routes to #index" do
      get("/texts").should route_to("texts#index")
    end

    it "routes to #new" do
      get("/texts/new").should route_to("texts#new")
    end

    it "routes to #show" do
      get("/texts/1").should route_to("texts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/texts/1/edit").should route_to("texts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/texts").should route_to("texts#create")
    end

    it "routes to #update" do
      put("/texts/1").should route_to("texts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/texts/1").should route_to("texts#destroy", :id => "1")
    end

  end
end
