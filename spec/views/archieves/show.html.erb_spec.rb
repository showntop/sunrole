require 'rails_helper'

RSpec.describe "archieves/show", :type => :view do
  before(:each) do
    @archieve = assign(:archieve, Archieve.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
