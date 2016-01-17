require 'rails_helper'

RSpec.describe "Depts", type: :request do
  describe "GET /depts" do
    it "works! (now write some real specs)" do
      get depts_path
      expect(response).to have_http_status(200)
    end
  end
end
