require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    @user = create(:user)
  end

  describe "GET #index" do

    it "returns http success" do
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
