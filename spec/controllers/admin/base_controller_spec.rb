require 'rails_helper'

RSpec.describe Admin::BaseController, type: :controller do

  controller do
    def index; end
  end

  context "when admin" do
    let(:user) { create(:user, role: :admin) }
    before { sign_in user }

    it "returns the correct response" do
      get :index
      expect(response).to be_successful
    end
  end
end
