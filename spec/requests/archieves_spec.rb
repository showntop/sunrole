require 'rails_helper'

RSpec.describe "Archieves", :type => :request do
  describe "GET /archieves" do
    it "works! (now write some real specs)" do
      get archieves_path
      expect(response).to have_http_status(200)
    end
  end
end
