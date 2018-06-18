require 'rails_helper'

RSpec.describe Reviewer::BaseController, type: :controller do
  controller do
    def index
      head :ok
    end
  end

  context "when reviewer" do
    let(:user) { create(:user, role: :reviewer) }
    before { sign_in user }

    it "returns the correct response" do
      get :index
      expect(response).to be_successful
    end
  end
end
