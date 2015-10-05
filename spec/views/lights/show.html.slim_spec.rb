require 'rails_helper'

RSpec.describe "lights/show", type: :view do
  before(:each) do
    @light = assign(:light, Light.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
