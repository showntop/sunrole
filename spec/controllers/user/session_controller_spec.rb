require 'rails_helper'

RSpec.describe User::SessionController, :type => :controller do

  describe " #create" do

    let(:user) { create(:user) }

    it { expect(user).to be_present }
    it { expect(user.login).to eq('showntop') }

    context 'user name not exists' do
      it "returns http success" do
        xhr :post, :create, login: 'notuser', password: 'xxx'
        expect(response).to have_http_status(:success)
        expect(session[:current_user_id]).to be_nil
      end
    end

    context 'user password not right' do
      it "returns http success" do
        xhr :post, :create, login: 'notuser', password: 'wrong password'
        expect(response).to have_http_status(:success)
        expect(session[:current_user_id]).to be_nil
      end
    end

    context 'success login condition' do
      it "session was set and return status success" do
        xhr :post, :create, login: user.login, password: 'mypassword'
        expect(response).to have_http_status(:success)

        expect(session[:current_user_id]).to eq(user.id)
      end
    end
  end

  describe "GET #destroy" do
    before do
      @user = create(:user)
      xhr :post, :create, login: @user.login, password: 'mypassword'

      xhr :delete, :destroy, id: @user.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(session[:current_user_id]).to be_nil
    end
  end

end
