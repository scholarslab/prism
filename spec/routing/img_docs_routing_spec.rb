require "spec_helper"

describe ImgDocsController do
  describe "routing" do

    it "routes to #index" do
      get("/img_docs").should route_to("img_docs#index")
    end

    it "routes to #new" do
      get("/img_docs/new").should route_to("img_docs#new")
    end

    it "routes to #show" do
      get("/img_docs/1").should route_to("img_docs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/img_docs/1/edit").should route_to("img_docs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/img_docs").should route_to("img_docs#create")
    end

    it "routes to #update" do
      put("/img_docs/1").should route_to("img_docs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/img_docs/1").should route_to("img_docs#destroy", :id => "1")
    end

  end
end
