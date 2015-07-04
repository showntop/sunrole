require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET #index" do
    it "redirect to login" do
      get :index
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_url)
    end

  end

end
