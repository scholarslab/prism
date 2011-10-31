require "spec_helper"

describe TextSpansController do
  describe "routing" do

    it "routes to #index" do
      get("/text_spans").should route_to("text_spans#index")
    end

    it "routes to #new" do
      get("/text_spans/new").should route_to("text_spans#new")
    end

    it "routes to #show" do
      get("/text_spans/1").should route_to("text_spans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/text_spans/1/edit").should route_to("text_spans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/text_spans").should route_to("text_spans#create")
    end

    it "routes to #update" do
      put("/text_spans/1").should route_to("text_spans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/text_spans/1").should route_to("text_spans#destroy", :id => "1")
    end

  end
end
