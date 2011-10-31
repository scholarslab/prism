require "spec_helper"

describe ImgSpansController do
  describe "routing" do

    it "routes to #index" do
      get("/img_spans").should route_to("img_spans#index")
    end

    it "routes to #new" do
      get("/img_spans/new").should route_to("img_spans#new")
    end

    it "routes to #show" do
      get("/img_spans/1").should route_to("img_spans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/img_spans/1/edit").should route_to("img_spans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/img_spans").should route_to("img_spans#create")
    end

    it "routes to #update" do
      put("/img_spans/1").should route_to("img_spans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/img_spans/1").should route_to("img_spans#destroy", :id => "1")
    end

  end
end
