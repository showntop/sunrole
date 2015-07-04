require 'rails_helper'

RSpec.describe "archieves/new", :type => :view do
  before(:each) do
    assign(:archieve, Archieve.new())
  end

  it "renders new archieve form" do
    render

    assert_select "form[action=?][method=?]", archieves_path, "post" do
    end
  end
end
