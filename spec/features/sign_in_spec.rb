require 'rails_helper'

RSpec.describe "Sign_in", type: :feature, routes: true do
  before do
    create(:company)
  end

  context "when user is admin" do
    let(:user) { create(:user, role: :admin)}

    it "Sign in as admin" do
      visit_sign_in_and_fill_form
      expect(current_path).to eq(admin_dashboards_path)
    end
  end

  context "when user is reviewer" do
    let(:user) { create(:user, role: :reviewer)}

    it "Sign in as reviewer" do
      visit_sign_in_and_fill_form
      expect(current_path).to eq(reviewer_dashboards_path)
    end
  end

  context "when user is candidate" do
    let(:user) { create(:user, role: :candidate) }

    it "Sign in as candidate" do
      visit_sign_in_and_fill_form
      expect(current_path).to eq(root_path)
    end
  end

  def visit_sign_in_and_fill_form
   visit('/user/sign_in')

   fill_in('user[email]', with: user.email)
   fill_in('user[password]', with: user.password)

   click_button('Log in')
  end
end
