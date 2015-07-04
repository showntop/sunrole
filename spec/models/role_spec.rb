require 'rails_helper'

RSpec.describe Role, :type => :model do
  let(:role) { create(:role)}
  it{ expect(role).to be_valid }
  
end
