require 'rails_helper'

RSpec.describe "Sign_in", type: :feature, routes: true do
  before do
    create(:company)
  end

  context "when user is admin" do
    let(:user) { create(:user, role: :admin)}

    it "Sign in as admin" do
      sign_in user
      expect(current_path).to eq(admin_dashboards_path)
    end
  end

  context "when user is reviewer" do
    let(:user) { create(:user, role: :reviewer)}

    it "Sign in as reviewer" do
      sign_in user
      expect(current_path).to eq(reviewer_dashboards_path)
    end
  end

  context "when user is candidate" do
    let(:user) { create(:user, role: :candidate) }

    it "Sign in as candidate" do
      sign_in user
      expect(current_path).to eq(root_path)
    end
  end
end
