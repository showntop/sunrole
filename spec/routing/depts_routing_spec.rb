require "rails_helper"

RSpec.describe DeptsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/depts").to route_to("depts#index")
    end

    it "routes to #new" do
      expect(:get => "/depts/new").to route_to("depts#new")
    end

    it "routes to #show" do
      expect(:get => "/depts/1").to route_to("depts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/depts/1/edit").to route_to("depts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/depts").to route_to("depts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/depts/1").to route_to("depts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/depts/1").to route_to("depts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/depts/1").to route_to("depts#destroy", :id => "1")
    end

  end
end
