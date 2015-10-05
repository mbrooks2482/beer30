require "rails_helper"

RSpec.describe LightsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lights").to route_to("lights#index")
    end

    it "routes to #new" do
      expect(:get => "/lights/new").to route_to("lights#new")
    end

    it "routes to #show" do
      expect(:get => "/lights/1").to route_to("lights#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lights/1/edit").to route_to("lights#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lights").to route_to("lights#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lights/1").to route_to("lights#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lights/1").to route_to("lights#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lights/1").to route_to("lights#destroy", :id => "1")
    end

  end
end
