require 'rails_helper'

RSpec.describe UserRole, :type => :model do
  before do 
    @user = create(:user)
    @role = Role.create
    @user_role = UserRole.create({user: @user, role: @role})
  end
  it{ expect(@user_role).to be_valid}
  
  context 'when user or role not exist' do 
    it 'raise error' do 
      expect { UserRole.create!({user: nil, role: nil}) }.to raise_error
    end
  end
end
