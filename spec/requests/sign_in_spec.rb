require 'rails_helper'

RSpec.describe 'Sign in', type: :request do

  context "when user is admin" do
    let(:user) { create(:user, role: :admin) }

    it "is redirected to right path" do
      post "/user/sign_in", params: { user: { email: user.email, password: user.password }  }

      expect(response).to redirect_to(admin_dashboards_path)
    end
  end

  context "when user is review" do
    let(:user) { create(:user, role: :reviewer) }

    it "is redirected to right path" do
      post "/user/sign_in", params: { user: { email: user.email, password: user.password }  }

      expect(response).to redirect_to(reviewer_dashboards_path)
    end
  end

  context "when user is candidate" do
    let(:user) { create(:user, role: :candidate) }

    it "is redirected to right path" do
      post "/user/sign_in", params: { user: { email: user.email, password: user.password }  }

      expect(response).to redirect_to(root_path)
    end
  end

end
