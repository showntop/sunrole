require "rails_helper"

RSpec.describe ArchievesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/archieves").to route_to("archieves#index")
    end

    it "routes to #new" do
      expect(:get => "/archieves/new").to route_to("archieves#new")
    end

    it "routes to #show" do
      expect(:get => "/archieves/1").to route_to("archieves#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/archieves/1/edit").to route_to("archieves#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/archieves").to route_to("archieves#create")
    end

    it "routes to #update" do
      expect(:put => "/archieves/1").to route_to("archieves#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/archieves/1").to route_to("archieves#destroy", :id => "1")
    end

  end
end
