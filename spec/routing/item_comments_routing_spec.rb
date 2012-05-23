require "spec_helper"

describe ItemCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/item_comments").should route_to("item_comments#index")
    end

    it "routes to #new" do
      get("/item_comments/new").should route_to("item_comments#new")
    end

    it "routes to #show" do
      get("/item_comments/1").should route_to("item_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_comments/1/edit").should route_to("item_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_comments").should route_to("item_comments#create")
    end

    it "routes to #update" do
      put("/item_comments/1").should route_to("item_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_comments/1").should route_to("item_comments#destroy", :id => "1")
    end

  end
end
