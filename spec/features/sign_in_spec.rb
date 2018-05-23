require 'rails_helper'

RSpec.describe "Sign_in", type: :feature, routes: true do
  let(:user) { create(:user, role: :admin)}
  let(:user1) { create(:user, role: :reviewer)}
  let(:user2) { create(:user, role: :candidate) }

  before do
    create(:company)
  end

  it 'Sign in as admin' do
    visit('/user/sign_in')

    #binding.pry

    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)

    click_button('Log in')

    expect(current_path).to eq(admin_dashboards_path)
  end

  it 'Sign in as reviewer' do
    visit('/user/sign_in')

    fill_in('user_email', with: user1.email)
    fill_in('user_password', with: user1.password)

    click_button('Log in')

    expect(current_path).to eq(reviewer_dashboards_path)
  end

  it "Sign in as candidate" do
    visit('/user/sign_in')

    fill_in('user_email', with: user2.email)
    fill_in('user_password', with: user2.password)

    click_button('Log in')

    expect(current_path).to eq(root_path)
  end
end
