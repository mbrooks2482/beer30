require 'rails_helper'

RSpec.describe "lights/edit", type: :view do
  before(:each) do
    @light = assign(:light, Light.create!())
  end

  it "renders the edit light form" do
    render

    assert_select "form[action=?][method=?]", light_path(@light), "post" do
    end
  end
end
