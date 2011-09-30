require "spec_helper"

describe RecurrencesController do
  describe "routing" do

    it "routes to #index" do
      get("/recurrences").should route_to("recurrences#index")
    end

    it "routes to #new" do
      get("/recurrences/new").should route_to("recurrences#new")
    end

    it "routes to #show" do
      get("/recurrences/1").should route_to("recurrences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recurrences/1/edit").should route_to("recurrences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recurrences").should route_to("recurrences#create")
    end

    it "routes to #update" do
      put("/recurrences/1").should route_to("recurrences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recurrences/1").should route_to("recurrences#destroy", :id => "1")
    end

  end
end
