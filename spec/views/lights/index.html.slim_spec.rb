require 'rails_helper'

RSpec.describe "lights/index", type: :view do
  before(:each) do
    assign(:lights, [
      Light.create!(),
      Light.create!()
    ])
  end

  it "renders a list of lights" do
    render
  end
end
