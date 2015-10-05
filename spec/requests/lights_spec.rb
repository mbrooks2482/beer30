require 'rails_helper'

RSpec.describe "Lights", type: :request do
  describe "GET /lights" do
    it "works! (now write some real specs)" do
      get lights_path
      expect(response).to have_http_status(200)
    end
  end
end
