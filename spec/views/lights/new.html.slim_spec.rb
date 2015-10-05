require 'rails_helper'

RSpec.describe "lights/new", type: :view do
  before(:each) do
    assign(:light, Light.new())
  end

  it "renders new light form" do
    render

    assert_select "form[action=?][method=?]", lights_path, "post" do
    end
  end
end
