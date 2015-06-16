require 'rails_helper'

RSpec.describe "archieves/edit", :type => :view do
  before(:each) do
    @archieve = assign(:archieve, Archieve.create!())
  end

  it "renders the edit archieve form" do
    render

    assert_select "form[action=?][method=?]", archieve_path(@archieve), "post" do
    end
  end
end
