require 'rails_helper'

RSpec.describe "archieves/index", :type => :view do
  before(:each) do
    assign(:archieves, [
      Archieve.create!(),
      Archieve.create!()
    ])
  end

  it "renders a list of archieves" do
    render
  end
end
