require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }
  before do
    sign_in user
    get :index
  end

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the correct template" do
      expect(response).to render_template(:index)
    end
  end

end
